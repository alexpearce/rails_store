class AddUsernameToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :username, :string
  end

  def self.down
    remove_column :admins, :username
  end
end
