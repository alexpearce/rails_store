class Page < ActiveRecord::Base
  has_many :options, :class_name => 'Item', :foreign_key => 'item_id'
  belongs_to :super, :class_name => 'Item'
  
  acts_as_tree
end
