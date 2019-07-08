class UsdaApiService
  def initialize(search_query)
    @search_query = search_query
  end

  def get_ndb_search
    response = connection.get('/ndb/search/')
    JSON.parse(response.body, symbolize_names: true)[:list]
  end

  private
  def connection
    @conn = Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['format'] = 'json'
      faraday.params['q'] = @search_query
      faraday.params['sort'] = 'r'
      faraday.params['max'] = '10'
      faraday.params['offset'] = '0'
      faraday.params['api_key'] = ENV["GOV_API_KEY"]

      faraday.adapter Faraday.default_adapter
    end
  end
end