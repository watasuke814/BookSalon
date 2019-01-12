class AddPicImageToPosts < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :pic_image, :string
  end
end
