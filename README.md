Super Docopt
==================================================

![repocard](https://repocard.dannyben.com/svg/super_docopt.svg)

Create command line utilities with ease.
*Super Docopt* is an extension that provides syntactic sugar to [Docopt][1]

Install
--------------------------------------------------

    $ gem install super_docopt


Getting Started
--------------------------------------------------

```ruby
# my_command_line.rb
require 'super_docopt'

class MyCommandLine < SuperDocopt::Base
  version '1.0.0'
  docopt 'docopt.txt'
  subcommands ['download', 'upload']

  def download
    puts "#download called with #{args}"
  end

  def upload
    puts "#upload called"
  end
end

MyCommandLine.execute ARGV
```

```plain
# docopt.txt
My Command Line

Usage:
  mock download [--force]
  mock upload
  mock (-h|--help|--version)
```

See the [examples](/examples) folder for more examples.

---

[1]: http://docopt.org/
