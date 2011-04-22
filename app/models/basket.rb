class Basket < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  # sum the prices of all the items in the basket,
  # not including postage
  def subtotal
    # total price of everything in the basket
    self.line_items.to_a.sum { |li| li.quantity * li.item.price }
  end
  
  # generates the postage for multiple items.
  # n items does not mean n times the postage,
  # it means a factor of 1.2^(n-1).
  def postage
    self.line_items.to_a.sum { |li|
      li.item.postage * 1.2**(li.quantity - 1)
    }
  end
  
  # returns a URL which points to the PayPal Web Payments Standard
  # gateway. Builds the baskets and 
  def paypal_url(return_url)
    values = {  
      :business => 'paypal_1303466866_biz@alexpearce.me',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      # invoice number is the basket ID
      :invoice => id
    }
    
    # add each line item to the cart, using the self_with_parent method
    # to respect item options
    line_items.each_with_index do |li, index|
      values.merge!({
        "amount_#{index + 1}" => li.item.price,
        "item_name_#{index + 1}" => li.item.self_with_parent,
        "item_number_#{index + 1}" => li.item.id,
        "quantity_#{index + 1}" => li.quantity
      })
    end 
    "https://www.sandbox.paypal.com/cgi-bin/webscr?#{values.to_query}"
  end
end