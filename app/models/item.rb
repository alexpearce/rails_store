class Item < ActiveRecord::Base
  validates_presence_of :name, :price, :stock, :description, :image
  validates_uniqueness_of :name
  validates_numericality_of :price
  validates_numericality_of :stock, :integer => true
end
