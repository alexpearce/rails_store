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
end
