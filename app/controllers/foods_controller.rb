class FoodsController < ApplicationController
  def index
    @search_string = params['q']
    @conn = Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.params['format'] = 'json'
      faraday.params['q'] = @search_string
      faraday.params['sort'] = 'r'
      faraday.params['max'] = '10'
      faraday.params['offset'] = '0'
      faraday.params['api_key'] = ENV["GOV_API_KEY"]

      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get('/ndb/search/')
    results = JSON.parse(response.body, symbolize_names: true)[:list]
    @total_results_count = results[:total]

    @foods = results[:item].map do |result|
      Food.new(result)
    end
  end
end