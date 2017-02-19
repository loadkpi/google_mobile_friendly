require "bundler/setup"
require 'webmock/rspec'
require 'simplecov'

# SimpleCov.root GEM_ROOT
SimpleCov.start do
  add_filter "/spec/"
end

require "google_mobile_friendly"