module SuperDocoptMocks
  class Basic < SuperDocopt
    version '0.0.1'
    docopt File.expand_path 'basic.txt', __dir__
    subcommands ['hello', 'not-implemented']

    def hello(args)
      puts "#hello called with #{args}"
    end

  end
end
