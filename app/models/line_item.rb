class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :basket
  
  validates_presence_of :item_id, :basket_id, :quantity
end
