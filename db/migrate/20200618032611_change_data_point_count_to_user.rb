class ChangeDataPointCountToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :point_count, :unsigned_bigint
  end
end
