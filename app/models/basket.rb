class Basket < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def subtotal
    # total price of everything in the basket
    self.line_items.to_a.sum { |li| li.quantity * li.item.price }
  end
  
  def postage
    self.line_items.to_a.sum { |li|
      li.item.postage * 1.2**(li.quantity - 1)
    }
  end
  
  def paypal_url(return_url)
    values = {  
      :business => 'paypal_1303466866_biz@alexpearce.me',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    
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