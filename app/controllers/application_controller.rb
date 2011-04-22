class ApplicationController < ActionController::Base
  protect_from_forgery
  
  after_filter :persist_location
  
  helper_method :current_basket
  
  # get the current user's basket or create a new one
  def current_basket
    if session[:basket_id]
      # current_basket might be called several times on one page,
      # so either the instance varia
      @basket ||= Basket.find(session[:basket_id], :include => :line_items)
      session[:basket_id] = nil if @basket.purchased_at
    end
    
    unless session[:basket_id]
      @basket = Basket.create!
      session[:basket_id] = @basket.id
    end
    # return the fetched/new basket
    @basket
  end
  
  private
    
    # if a user logs in, this method ensures that they return to the page they came from
    def persist_location
      if request.get? && request.format.html? && !request.xhr? && !devise_controller? 
        session[:"user_return_to"] = request.fullpath
      end 
    end
end