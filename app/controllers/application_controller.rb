class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_or_create_basket
  
  private
  
    def find_or_create_basket
      @basket = Basket.find(session[:basket_id])
    rescue ActiveRecord::RecordNotFound
      @basket = Basket.create
      session[:basket_id] = basket.id
    end
end
