class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :comic_board_id
      t.integer :parent_id
      t.text :comment_text

      t.timestamps
    end
  end
end
