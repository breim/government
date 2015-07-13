class AddImageToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :image_file_name, :string
  	add_column :users, :image_content_type, :string
  	add_column :users, :image_file_size, :integer
  end
end