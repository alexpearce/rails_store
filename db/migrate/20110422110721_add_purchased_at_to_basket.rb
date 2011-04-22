class AddPurchasedAtToBasket < ActiveRecord::Migration
  def self.up
    add_column :baskets, :purchased_at, :time
  end

  def self.down
    remove_column :baskets, :purchased_at
  end
end
