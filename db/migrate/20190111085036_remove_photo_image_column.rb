class RemovePhotoImageColumn < ActiveRecord::Migration[5.1]
  def change
  	remove_column :posts, :photo_image, :string
  end
end
