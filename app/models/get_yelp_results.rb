class GetYelpResults

  attr_reader :query, :coordinates

  def initialize(query, lat, lon)
    @query = query
    @coordinates = { latitude: lat, longitude: lon }
  end  

  
  YELP = Yelp::Client.new(
    { consumer_key: "cbOyL0UUJw4Co2K6wWuj3g",
      consumer_secret: "ydBnkodBIIyT0LZZFflkvOmn6s0", 
      token: "TWTfIdvI530rk-bURsuK9ltpz3mrqJxu",
      token_secret: "RIxPZ1hHLLBd_zJI3gpWKCV_bL8"                       
    })

  def get_yelp_results
    search_results = []
    params = {term: self.query, limit: 1, sort: 1}
    response = YELP.search_by_coordinates(@coordinates, params)
    response.businesses.each do |biz|
      distance = (biz.distance.to_f * 3.28084)
        if distance > 1000
          distance = "#{(distance * 0.000189394).to_s.slice(0,3)} miles"  
        else
          distance = "#{distance.to_i} ft"  
        end   
      address = [biz.location.address, biz.location.city, biz.location.state_code, biz.location.postal_code].join(", ")
      search_result_coords = Geocoder.coordinates(address)  
      search_results << [biz.name, biz.rating, biz.url, address, distance, search_result_coords]

    end
    search_results  
  end

end   











