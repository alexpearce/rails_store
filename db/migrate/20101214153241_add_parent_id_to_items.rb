class AddParentIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :parent_id, :integer
  end

  def self.down
    remove_column :items, :parent_id
  end
end
