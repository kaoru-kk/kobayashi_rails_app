class CreatePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :points do |t|
      t.string :point_title
      t.integer :point_number

      t.timestamps
    end
  end
end
