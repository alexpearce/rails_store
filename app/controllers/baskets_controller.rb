class BasketsController < ApplicationController
  respond_to :html
  
  def show
    @basket = Basket.find(params[:id])
    respond_with @basket
  end
end
