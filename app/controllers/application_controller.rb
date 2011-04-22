class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_or_create_basket
  
  after_filter :persist_location
  
  private
  
    # we use the basket on every page; it's either in the sidebar
    # or we're in the baskets controller, so we find it here
    # TODO refactor this so that it returns the current basket
    # (or creates a new one) only on request rather than every page load
    def find_or_create_basket
      if session[:basket_id]
        @basket = Basket.find(session[:basket_id], :include => :line_items)
        session[:basket_id] = nil if @basket.purchased_at
      end
      
      unless session[:basket_id]
        @basket = Basket.create!
        session[:basket_id] = @basket.id
      end
    end
    
    def persist_location
      # if a user logs in, this method ensures that they return to the page they came from
      if request.get? && request.format.html? && !request.xhr? && !devise_controller? 
        session[:"user_return_to"] = request.fullpath
      end 
    end
end