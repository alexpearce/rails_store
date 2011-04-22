class BasketsController < ApplicationController
  respond_to :html
  
  def show
    if current_basket.line_items.count == 0
      redirect_to items_path, :notice => 'You do not have any items in your basket.'
    else
      respond_with current_basket
    end
  end
end