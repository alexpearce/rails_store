class Basket < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  
  def total
    # total price of everything in the basket
    self.line_items.to_a.sum { |li| li.quantity * li.item.price }
  end
end
