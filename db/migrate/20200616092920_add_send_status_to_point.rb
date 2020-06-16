class AddSendStatusToPoint < ActiveRecord::Migration[6.0]
  def change
    add_column :points, :send_status, :boolean, default: false
  end
end
