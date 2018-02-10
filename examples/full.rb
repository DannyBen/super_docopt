require 'super_docopt'

class MyCLI < SuperDocopt::Base
  version '0.1.0'
  docopt File.expand_path 'full.txt', __dir__
  subcommands ['download', 'start-server', {'initialize' => 'init'}]

  def before_execute
    puts "before_execute called"
  end

  def after_execute
    puts "after_execute called"
  end

  def download
    puts "download called"
    p args
  end

  def start_server
    as_daemon = args['--daemon'] ? 'with daemon' : 'without daemon'
    puts "start_server called #{as_daemon}"
  end

  def init
    puts "init called"
  end
end

MyCLI.execute ARGV
