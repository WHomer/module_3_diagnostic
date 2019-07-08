class FoodsController < ApplicationController
  def index
    render locals: {
      facade: FoodsIndexFacade.new(params['q'])
    }
  end
end