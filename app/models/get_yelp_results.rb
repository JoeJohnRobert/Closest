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
    params = {term: self.query, limit: 4, sort: 2}
    response = YELP.search('Brooklyn', params)
    response.businesses.each do |biz|
      search_results << [biz.name, biz.rating, biz.url]
    end
    search_results  
  end
#SEARCH BY COORDINATES EXAMPLE
# coordinates = { latitude: 37.7577, longitude: -122.4376 }
# client.search_by_coordinates(coordinates, params)


end   














