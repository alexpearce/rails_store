class AddParamsToPaymentNotification < ActiveRecord::Migration
  def self.up
    add_column :payment_notifications, :params, :text
  end

  def self.down
    remove_column :payment_notifications, :params
  end
end
