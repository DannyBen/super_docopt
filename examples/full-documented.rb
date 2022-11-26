require 'super_docopt'

class MyCLI < SuperDocopt::Base
  # Specify verison number (will be shown when using --version)
  version '0.1.0'

  # Specify location of docopt file
  # Read more about the syntax of this file in http://docopt.org
  docopt File.expand_path 'full.txt', __dir__

  # Specify all available subcommands.
  #
  # This is an array, where each item can:
  #   - a string that represents both the name of the subcommand in your
  #     CLI application and the method name
  #   - a hash with one key => value, where the key is the subcommand in
  #     your CLI application, and the value is the method name.
  #     This feature was designed to allow having commands that may be
  #     reserved names in Ruby (e.g. `initialize`).
  #
  # Commands with '-' will use '_' when looking for a method name
  # (e.g. the command 'start-server' will need a 'start_server' method).
  subcommands ['download', 'start-server', { 'initialize' => 'init' }]

  # Optional:
  # Implement `before_execute` with any logic.
  # You have access to all the supplied arguments through the `args`
  # instance variable.
  def before_execute
    puts 'before_execute called'
  end

  # Optional:
  # Implement `after_execute` with any logic.
  # You have access to all the supplied arguments through the `args`
  # instance variable.
  def after_execute
    puts 'after_execute called'
  end

  # Subcommand Implementation
  # Each subcommand should have a method implementation.
  # You can use the `args` instance variable to access all the arguments
  # that were supplied by the command line.

  def download
    puts 'download called'
    p args
  end

  def start_server
    as_daemon = args['--daemon'] ? 'with daemon' : 'without daemon'
    puts "start_server called #{as_daemon}"
  end

  def init
    puts 'init called'
  end
end

MyCLI.execute ARGV
