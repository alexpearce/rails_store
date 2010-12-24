class Item < ActiveRecord::Base
  has_many :line_items
  has_many :options, :class_name => 'Item', :foreign_key => 'item_id'
  belongs_to :super, :class_name => 'Item'
  
  before_destroy :ensure_not_referenced_by_line_item
  
  acts_as_tree
  
  validates_presence_of :name, :price, :stock, :description, :image
  validates_uniqueness_of :name
  validates_numericality_of :price
  validates_numericality_of :stock, :integer => true
  
  # paperclip
  has_attached_file :image,
                    :styles => { :thumb => '128x128#', :option => '32x32#', :icon => '16x16#' },
                    #:url => "/:class/:attachment/:id/:basename_:style.:extension",
                    #:default_url => "/:class/:attachment/missing_:style.png",
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "/store/:class/:attachment/:id/:basename_:style.:extension"
                    
  
  def image_path
    '/images/' + self.image
  end
  
  def self_with_parent
    if self.parent
      "#{self.parent.name} (#{self.name})"
    else
      self.name
    end
  end
  
  def option_select
    ret = "#{self.name} - #{sprintf("%.2f", price)}"
    ret.concat ' (Sold Out)' if self.stock == 0
    return ret
  end
  
  private
  
    def ensure_not_referenced_by_line_item
      if line_items.count.zero?
        true
      else
        errors[:base] << 'Line Items present.'
        false
      end
    end
end
