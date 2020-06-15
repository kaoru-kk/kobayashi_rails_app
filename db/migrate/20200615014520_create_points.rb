class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.string :title
      t.text :detail
      t.integer :point
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
