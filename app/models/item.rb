class Item < ActiveRecord::Base
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_line_item
  
  validates_presence_of :name, :price, :stock, :description, :image
  validates_uniqueness_of :name
  validates_numericality_of :price
  validates_numericality_of :stock, :integer => true
  
  # paperclip
  has_attached_file :image,
                    :styles => { :thumb => '128x128#', :icon => '16x16#' },
                    :url => "/:class/:attachment/:id/:basename_:style.:extension"
  
  def image_path
    '/images/' + self.image
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
