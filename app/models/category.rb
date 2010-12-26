class Category < ActiveRecord::Base
  has_and_belongs_to_many :items
  
  before_save :assign_slug
  
  private
  
    def assign_slug
      self.slug = self.name.parameterize
    end
end