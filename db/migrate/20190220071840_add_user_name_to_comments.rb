class AddUserNameToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_image, :string
  end
end
