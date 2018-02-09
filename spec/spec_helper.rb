require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler'
Bundler.require :default, :development

include SuperDocopt

# Load mocks
require 'require_all'
require_all 'spec/mocks/*.rb'

