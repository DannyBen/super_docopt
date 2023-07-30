lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'super_docopt/version'

Gem::Specification.new do |s|
  s.name        = 'super_docopt'
  s.version     = SuperDocopt::VERSION
  s.summary     = 'docopt-based command line utility builder'
  s.description = 'Extension to docopt for defining command line utilities with ease'
  s.authors     = ['Danny Ben Shitrit']
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.*']
  s.homepage    = 'https://github.com/DannyBen/super_docopt'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.0'

  s.add_runtime_dependency 'docopt_ng', '~> 0.7'

  s.metadata['rubygems_mfa_required'] = 'true'
end
