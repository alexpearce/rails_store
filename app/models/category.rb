class Category < ActiveRecord::Base
  has_and_belongs_to_many :items
  
  before_save :assign_slug
  
  validates_presence_of :name
  
  def to_param
    self.slug
  end
  
  private
  
    def assign_slug
      self.slug = self.name.parameterize
    end
end