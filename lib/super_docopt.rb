require 'singleton'
require 'docopt'

class SuperDocopt
  include Singleton

  VERSION = '0.0.1'

  def self.execute(argv=[])
    instance.execute_cli argv
  end
  
  def execute_cli(argv=[])
    doc = File.read docopt_file
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
      command = subcommand.to_s
      method  = subcommand.to_s

      if subcommand.is_a? Hash
        command = subcommand.keys.first.to_s
        method = subcommand.values.first.to_s
      end

      command.gsub! '_', '-'
      method.gsub! '-', '_'

      if args[command]
        raise NotImplementedError, "Please implement ##{method}" unless respond_to? method
        send method, args
        return
      end
    end
  end

end
