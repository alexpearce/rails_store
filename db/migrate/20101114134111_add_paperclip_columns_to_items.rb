class AddPaperclipColumnsToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :image_file_name, :string # original file name
    add_column :items, :image_content_type, :string # mime type
    add_column :items, :image_file_size, :integer # file size in bytes
  end

  def self.down
    remove_column :items, :image_file_name
    remove_column :items, :image_content_type
    remove_column :items, :image_file_size
  end
end