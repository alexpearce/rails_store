class BasketsController < ApplicationController
  respond_to :html
  
  def show
    if @basket.line_items.count == 0
      redirect_to items_path, :notice => 'You do not have any items in your basket.'
    else
      respond_with @basket
    end
  end
end