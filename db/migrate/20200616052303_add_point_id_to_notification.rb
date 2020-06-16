class AddPointIdToNotification < ActiveRecord::Migration[6.0]
  def up
    add_column :notifications, :point_id, :integer
  end
  
  def down
    remove_column :notifications, :point_id, :integer
  end
end
