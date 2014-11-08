class GetFourSquareResults

 attr_reader :query, :coordinates, :version
 CLIENT = Foursquare2::Client.new(:client_id => 'KZVHSGAFQZ4KROUPWBSTS2AAST02DJR2BFE5EWR5RLHJRUM5', :client_secret => 'QU32FMB0EBACHOQBLCDHJ2MWIW2UWZMTSRGFYQTHV3ECZATA')

  def initialize(query, lat, lon)
    # @query = query
    @query = 'Coffee'
    # @coordinates = (lat, lon)
    @coordinates = '40.663498, -73.994319'
    @version = Time.now.strftime("%Y%m%d").to_i
  end  

  

  def get_foursquare_results
    search_results = []
    response = CLIENT.search_venues(:ll => @coordinates, :query => @query, :limit => 1, :v => @version)
    response["venues"].each do |biz|
      distance = (biz["location"]["distance"].to_f * 3.28084)
        if distance > 1000
          distance = "#{(distance * 0.000189394).to_s.slice(0,3)} miles"  
        else
          distance = "#{distance.to_i} ft"  
        end   
      address = biz["location"]["formattedAddress"]
      search_result_coords = [biz["location"]["lat"], biz["location"]["lon"]] 
      search_results << [biz["name"], biz["hereNow"]["count"], "http://www.foursquare.com", address, distance, search_result_coords]

    end
    search_results  
  end

end   











