class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.string :permalink
      t.string :links_to
      t.integer :order
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
