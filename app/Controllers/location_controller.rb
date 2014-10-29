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
    erb :'layout'
  end

  get '/results' do 
    @lat = params[:lat]
    @lon = params[:lon]
    @input = params[:input]
    # GetYelpResults.new.get_yelp_results
    hash = {:latitude => @lat, :longitude => @lon, :input => @input}.to_json
  end

end