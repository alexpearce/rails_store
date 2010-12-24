class RemoveImageFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :image
  end

  def self.down
    add_column :items, :image, :string
  end
end
