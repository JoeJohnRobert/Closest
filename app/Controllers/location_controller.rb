class LocationController < ApplicationController

  get '/' do 
    erb :'layout'
  end

  get '/lat/lon' do 
    @lat = params[:lat]
    @lon = params[:lon]
    # GetYelpResults.new.get_yelp_results
    hash = {:latitude => @lat, :longitude => @lon}.to_json
  end

end