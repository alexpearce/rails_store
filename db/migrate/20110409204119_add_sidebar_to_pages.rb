class AddSidebarToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :sidebar, :text
  end

  def self.down
    remove_column :pages, :sidebar
  end
end
