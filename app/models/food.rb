class Food
  attr_reader :ndb,
              :name,
              :group,
              :data_source
              :manufacturer

  def initialize(attributes)
    @ndb = attributes[:ndbno]
    @name = attributes[:name]
    @group = attributes[:group]
    @data_source = attributes[:ds]
    @manufacturer = attributes[:manu]
  end
end