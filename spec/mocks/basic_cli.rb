require 'yaml'

module SuperDocopt::Mocks
  class Basic < SuperDocopt::Base
    version '6.6.6'
    docopt File.expand_path 'basic.txt', __dir__
    subcommands [
      'hello',
      'not-implemented',
      'just-do-it',
      { 'check' => :verify },
    ]

    def before_execute
      @good_place = 'to initialize variable'
      puts '#before_execute called'
    end

    def after_execute
      puts '#after_execute called'
    end

    def hello
      puts "#hello called"
      puts args.to_yaml
    end

    def verify
      puts "#verify called #{@good_place}"
    end

    def just_do_it
      puts '#just_do_it called'
    end
  end
end
