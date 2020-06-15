class CreatePointRecievers < ActiveRecord::Migration[6.0]
  def change
    create_table :point_recievers do |t|
      t.integer :user_id
      t.integer :point_id

      t.timestamps
    end
  end
end
