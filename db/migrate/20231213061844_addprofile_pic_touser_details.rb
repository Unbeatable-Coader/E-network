class AddprofilePicTouserDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :user_details, :profile_pic, :string
  end
end
