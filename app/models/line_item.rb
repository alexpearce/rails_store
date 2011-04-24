class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :basket
  
  validates_presence_of :item_id, :basket_id, :quantity
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 9
end