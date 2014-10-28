require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"


Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/Controllers", "*.rb")].each {|f| require f}

require 'json'