require 'simplecov'
SimpleCov.start do
  track_files 'lib/*.rb'
  add_filter  'mocks'
end

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

# Load mocks
require 'require_all'
require_all 'spec/mocks/*.rb'
