class AddPointCategoryToPoints < ActiveRecord::Migration[6.0]
  def up
    add_column :points, :point_category, :string
  end

  def down
    remove_column :points, :point_category, :string
  end
end
