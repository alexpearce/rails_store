# coding: utf-8
class Item < ActiveRecord::Base
  has_many :line_items
  has_many :options, :class_name => 'Item', :foreign_key => 'item_id'
  belongs_to :super, :class_name => 'Item'
  has_and_belongs_to_many :categories
  
  # allow image deletion on forms
  attr_accessor :delete_image
  before_save :image_deletion
  
  # if some one has an item in their basket, don't destroy it
  before_destroy :ensure_not_referenced_by_line_item
  
  # has children
  acts_as_tree
  
  # search
  index do
    name
    description
  end
  
  # validation
  validates_presence_of :name, :price, :stock, :description
  validates_uniqueness_of :name
  validates_numericality_of :price
  validates_numericality_of :stock, :integer => true
  
  # scope to find only 'top level' items, i.e. no options
  scope :top_level, lambda {
    where(:parent_id => nil)
  }
  
  # recent items
  scope :recent, lambda { |number|
    order('id desc').limit(number)
  }
  
  # paperclip
  has_attached_file :image,
                    :styles => { :thumb => '128x128#', :option => '32x32#', :icon => '16x16#' },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :s3_host_alias => 's3.alexpearce.me',
                    :url => ":s3_alias_url",
                    :path => "/store/:class/:attachment/:id/:normalized_basename_:style.:extension",
                    :default_url => "/images/items/missing_:style.png"
                    
  
  def create_new_option
    self.children.new(
      :price => self.price,
      :stock => self.stock,
      :postage => self.postage
    )
  end
  
  # generate the image path
  def image_path
    '/images/' + self.image
  end
  
  # return a string showing the parent item and the option name in parens
  def self_with_parent
    if self.parent
      "#{self.parent.name} (#{self.name})"
    else
      self.name
    end
  end
  
  # return string for the dropdown on the item page
  def option_select
    ret = "#{self.name} - £#{sprintf("%.2f", self.price)}"
    ret.concat ' (Sold Out)' if self.stock == 0
    return ret
  end
  
  private
  
    def image_deletion
      self.image = nil if self.delete_image == '1'
    end
  
    def ensure_not_referenced_by_line_item
      if line_items.count.zero?
        true
      else
        errors[:base] << 'Line Items present.'
        false
      end
    end
end