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
      search_results << [biz.name, biz.rating, biz.url]
    end
    search_results  
  end

end   











