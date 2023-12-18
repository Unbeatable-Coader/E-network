class AddfileTopost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :file, :string
  end
end
