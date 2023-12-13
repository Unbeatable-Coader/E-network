class AddfollowersTousers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :followers, :integer
  end
end
