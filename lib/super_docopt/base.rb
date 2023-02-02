require 'singleton'
require 'docopt_ng'

module SuperDocopt
  class Base
    include Singleton

    attr_reader :args
    attr_accessor :version, :docopt, :subcommands

    def self.execute(argv = [])
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

    def execute_cli(argv = [])
      doc = File.read docopt
      begin
        @args = DocoptNG.docopt(doc, argv: argv, version: version)
        handle_subcommand
      rescue DocoptNG::Exit => e
        puts e.message
      end
    end

  private

    def handle_subcommand
      subcommands.each do |subcommand|
        input, method = translate_subcommand subcommand
        return execute_subcommand method if args[input]
      end
    end

    def execute_subcommand(method)
      raise NotImplementedError, "Please implement ##{method}" unless respond_to? method

      before_execute
      send method
      after_execute
    end

    def translate_subcommand(subcommand)
      input  = subcommand.to_s
      method = subcommand.to_s

      if subcommand.is_a? Hash
        input  = subcommand.keys.first.to_s
        method = subcommand.values.first.to_s
      end

      input  = input.tr '_', '-'
      method = method.tr  '-', '_'

      [input, method]
    end

    # Overridable Hooks

    def before_execute; end
    def after_execute; end
  end
end
