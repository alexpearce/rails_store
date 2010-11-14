class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.integer :item_id
      t.integer :basket_id

      t.timestamps
    end
  end

  def self.down
    drop_table :line_items
  end
end
