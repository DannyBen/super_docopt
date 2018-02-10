Super Docopt
==================================================

[![Gem](https://img.shields.io/gem/v/super_docopt.svg?style=flat-square)](https://rubygems.org/gems/super_docopt)
[![Build](https://img.shields.io/travis/DannyBen/super_docopt.svg?style=flat-square)](https://travis-ci.org/DannyBen/super_docopt)
[![Maintainability](https://img.shields.io/codeclimate/maintainability/DannyBen/super_docopt.svg?style=flat-square)](https://codeclimate.com/github/DannyBen/super_docopt)
[![Issues](https://img.shields.io/codeclimate/issues/github/DannyBen/super_docopt.svg?style=flat-square)](https://codeclimate.com/github/DannyBen/super_docopt)

---

Create command line utilities with ease.
*Super Docopt* is an extension that provides syntactic sugar to [Docopt][1]

---

Install
--------------------------------------------------

    $ gem install runfile


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
