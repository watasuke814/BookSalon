class RemoveImageNameFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :image_name, :string
  end
end
