class BasketsController < ApplicationController
  respond_to :html
  
  def show
    if current_basket.empty?
      redirect_to items_path, :alert => 'You do not have any items in your basket.'
    else
      respond_with current_basket
    end
  end
end