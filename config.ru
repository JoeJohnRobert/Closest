require './config/environment'

run Sinatra::Application

use LocationController
run ApplicationController

