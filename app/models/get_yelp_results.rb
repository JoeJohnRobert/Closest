class GetYelpResults < ActiveRecord::Base

  # attr_reader :query

  # def initialize(query)
  #   @query = query
  # end  

  
  YELP = Yelp::Client.new(
    { consumer_key: "cbOyL0UUJw4Co2K6wWuj3g",
      consumer_secret: "ydBnkodBIIyT0LZZFflkvOmn6s0", 
      token: "TWTfIdvI530rk-bURsuK9ltpz3mrqJxu",
      token_secret: "RIxPZ1hHLLBd_zJI3gpWKCV_bL8"                       
    })

  def get_yelp_results
    search_results = []
    params = {term: self.query, limit: 1, sort: 1}
    coordinates = { latitude: 40.7053130, longitude: -74.0139110 }
    response = YELP.search_by_coordinates(coordinates, params)
    response.businesses.each do |biz|
      search_results << [biz.name, biz.location.display_address, biz.url]
    end
    search_results  
  end
#SEARCH BY COORDINATES EXAMPLE

# client.search_by_coordinates(coordinates, params)


end   














