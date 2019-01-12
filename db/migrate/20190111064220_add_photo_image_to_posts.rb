class AddPhotoImageToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :photo_image, :string
  end
end
