require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"


Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/flatiron_presents#{ENV['SINATRA_ENV']}.sqlite"
)

require 'json'
require_all 'app'