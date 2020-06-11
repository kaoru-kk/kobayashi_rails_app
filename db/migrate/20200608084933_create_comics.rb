class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :author
      t.string :title
      t.text :overview
      t.string :seriazation_status, default: "連載中"

      t.timestamps
    end
  end
end
