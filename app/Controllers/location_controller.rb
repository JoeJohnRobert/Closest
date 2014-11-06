class LocationController < ApplicationController

  # get '/form' do
  #   erb :'/input'
  #   binding.pry
  # end

  post '/' do 
    # binding.pry
    @search = params[:location]
  end

  get '/' do 
    erb :index
  end

  get '/results' do 
    @lat = params[:lat]
    @lon = params[:lon]
    @input = params[:input]
    bananna = GetFourSquareResults.new(@input, @lat.to_f, @lon.to_f)
    # binding.pry
    bananna.get_foursquare_results.to_json
  end

end