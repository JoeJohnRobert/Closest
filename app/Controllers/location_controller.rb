class LocationController < ApplicationController

  post '/' do 
    @search = params[:location]
  end

  get '/' do 
    erb :index
  end

  get '/results' do 
    @lat = params[:lat]
    @lon = params[:lon]
    @input = params[:input]

    # results = GetYelpResults.new(@input, @lat.to_f, @lon.to_f)
    # results.get_yelp_results.to_json

    bananna = GetFourSquareResults.new(@input, @lat.to_f, @lon.to_f)
    # binding.pry
    bananna.get_foursquare_results.to_json
  end
end