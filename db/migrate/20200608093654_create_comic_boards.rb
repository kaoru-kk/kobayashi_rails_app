class CreateComicBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :comic_boards do |t|
      t.integer :comic_id

      t.timestamps
    end
  end
end
