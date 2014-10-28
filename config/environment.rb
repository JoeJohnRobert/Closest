require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"


Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}