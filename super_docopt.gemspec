lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date'
require 'super_docopt/version'

Gem::Specification.new do |s|
  s.name        = 'super_docopt'
  s.version     = SuperDocopt::VERSION
  s.date        = Date.today.to_s
  s.summary     = "docopt-based command line utility builder"
  s.description = "Extension to docopt for defining command line utilities with ease"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.homepage    = 'https://github.com/DannyBen/super_docopt'
  s.license     = 'MIT'
  s.required_ruby_version = ">= 2.2.2"

  s.add_runtime_dependency 'docopt', '~> 0.6'

  s.add_development_dependency 'runfile', '~> 0.10'
  s.add_development_dependency 'runfile-tasks', '~> 0.4'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'rspec_fixtures', '~> 0.3'
  s.add_development_dependency 'simplecov', '~> 0.15'
  s.add_development_dependency 'byebug', '~> 9.0'
  s.add_development_dependency 'requires', '~> 0.1'
end
