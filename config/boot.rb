ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require File.join(File.expand_path('../../', __FILE__), 'lib', 'config_helper')
