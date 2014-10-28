class GetYelpResults

  attr_reader :query

  def initialize(query)
    @query = query
  end  

  
  YELP = Yelp::Client.new(
    { consumer_key: "",
      consumer_secret: "", 
      token: "",
      token_secret: ""                       
    })

  def get_yelp_results
    search_results = []
    params = {term: 'donuts', limit: 4, sort: 1}
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














