class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :author
      t.string :title
      t.text :overview
      #0 = 連載中
      t.integer :seriazation_status, default: 0

      t.timestamps
    end
  end
end
