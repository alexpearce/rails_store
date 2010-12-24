class ItemsHaveAndBelongToManyCategories < ActiveRecord::Migration
  def self.up
    create_table :categories_items, :id => false do |t|
      t.references :category, :item
    end
  end

  def self.down
    drop_table :categories_items
  end
end
