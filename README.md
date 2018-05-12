Super Docopt
==================================================

[![Gem Version](https://badge.fury.io/rb/super_docopt.svg)](https://badge.fury.io/rb/super_docopt)
[![Build Status](https://travis-ci.com/DannyBen/super_docopt.svg?branch=master)](https://travis-ci.com/DannyBen/super_docopt)
[![Maintainability](https://api.codeclimate.com/v1/badges/2ca07d88e6f7b0b57e82/maintainability)](https://codeclimate.com/github/DannyBen/super_docopt/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2ca07d88e6f7b0b57e82/test_coverage)](https://codeclimate.com/github/DannyBen/super_docopt/test_coverage)

---

Create command line utilities with ease.
*Super Docopt* is an extension that provides syntactic sugar to [Docopt][1]

---

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
