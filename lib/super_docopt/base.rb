require 'singleton'
require 'docopt'

module SuperDocopt
  class Base
    include Singleton

    VERSION = '0.0.1'

    attr_accessor :version, :docopt, :subcommands

    def self.execute(argv=[])
      instance.execute_cli argv
    end

    def self.version(version)
      instance.version = version
    end

    def self.docopt(path)
      instance.docopt = path
    end

    def self.subcommands(list)
      instance.subcommands = list
    end
    
    def execute_cli(argv=[])
      doc = File.read docopt
      begin
        args = Docopt::docopt(doc, argv: argv, version: version)
        handle_subcommand args
      rescue Docopt::Exit => e
        puts e.message
      end
    end

    private

    def handle_subcommand(args)
      subcommands.each do |subcommand|
        input, method = translate_subcommand subcommand

        if args[input]
          raise NotImplementedError, 
            "Please implement ##{method}" unless respond_to? method

          send method, args
          return
        end
      end
    end

    def translate_subcommand(subcommand)
      input  = subcommand.to_s
      method = subcommand.to_s

      if subcommand.is_a? Hash
        input  = subcommand.keys.first.to_s
        method = subcommand.values.first.to_s
      end

      input  = input.gsub '_', '-'
      method = method.gsub  '-', '_'

      [input, method]
    end
  end
end