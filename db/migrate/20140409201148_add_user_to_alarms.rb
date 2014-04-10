class AddUserToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :user_id, :integer
  end
end
