class FoodsIndexFacade
  attr_reader :search_string

  def initialize(search_string)
    @search_string = search_string
  end

  def total_results_count
    usda_service.get_ndb_search[:total]
  end

  def foods
    usda_service.get_ndb_search[:item].map do |result|
      Food.new(result)
    end
  end

  private
  def usda_service
    UsdaApiService.new(@search_string)
  end
end