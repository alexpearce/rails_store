class AddStockAndPostageToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :postage, :float
  end

  def self.down
    remove_column :items, :stock
  end
end
