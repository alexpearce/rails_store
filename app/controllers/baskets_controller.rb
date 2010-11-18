class BasketsController < ApplicationController
  respond_to :html
  
  def show
    respond_with @basket
  end
end
