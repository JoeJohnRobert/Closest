class LocationController < ApplicationController

  # get '/form' do
  #   erb :'/input'
  #   binding.pry
  # end
  get '/' do 
    erb :'form'

    # erb :'layout'
  end

  post '/' do 
    # binding.pry
    # @search = params[:location]
    @search = params[:yelp]
    @connection = GetYelpResults.new(@search)
    @connection.save
    redirect 'search_results'
  end

  get '/search_results' do
    # binding.pry
    connection = GetYelpResults.first
    # binding.pry
    @yelp_info = connection.get_yelp_results
    erb :'search_results'
  end  

  get '/results' do 
    @lat = params[:lat]
    @lon = params[:lon]
    @input = params[:input]
    # GetYelpResults.new.get_yelp_results
    hash = {:latitude => @lat, :longitude => @lon, :input => @input}.to_json
  end

end