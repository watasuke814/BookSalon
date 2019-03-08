class AddImageNameToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :image_name, :string
  end
end
