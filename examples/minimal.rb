require 'super_docopt'

class MyCLI < SuperDocopt::Base
  version '0.1.0'
  docopt 'minimal.txt'
  subcommands ['hello', 'world']

  def hello
    name = args['NAME'] || 'world'
    puts "hello #{name}"
  end

  def world
    puts "#world called"
  end
end

MyCLI.execute ARGV
