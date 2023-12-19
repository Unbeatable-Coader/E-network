class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.string :user_id
      t.string :post_id

      t.timestamps
    end
  end
end
