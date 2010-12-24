class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_or_create_basket
  
  after_filter :persist_location
  
  private
  
    def find_or_create_basket
      @basket = Basket.find(session[:basket_id])
    rescue ActiveRecord::RecordNotFound
      @basket = Basket.create
      session[:basket_id] = @basket.id
    end
    
    def persist_location
      # if a user logs in, this method ensures that they return to the page they came from
      if request.get? && request.format.html? && !request.xhr? && !devise_controller? 
        session[:"user_return_to"] = request.fullpath
      end 
    end
end
