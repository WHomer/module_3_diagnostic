class UsdaApiService
  def initialize(search_query)
    @search_query = search_query
  end

  def get_ndb_search
    response = connection.get do |req|
      req.url ('/ndb/search/')
      req.params['format'] = 'json'
      req.params['q'] = @search_query
      req.params['sort'] = 'r'
      req.params['max'] = '10'
      req.params['offset'] = '0'
      req.params['api_key'] = ENV["GOV_API_KEY"]
    end
    JSON.parse(response.body, symbolize_names: true)[:list]
  end

  private

  def connection
    @conn = Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end