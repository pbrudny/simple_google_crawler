require 'rubygems'
require 'bundler'
require 'minitest/autorun'
require 'minitest-vcr'

MinitestVcr::Spec.configure!

VCR.configure do |config|
  config.cassette_library_dir = 'test/cassettes'
  config.hook_into :webmock
end