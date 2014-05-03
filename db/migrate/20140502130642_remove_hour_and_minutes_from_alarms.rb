class RemoveHourAndMinutesFromAlarms < ActiveRecord::Migration
  def up
  	remove_column :alarms, :hour
  	remove_column :alarms, :minute
  end
  def down
  	add_column :alarms, :hour, :integer
  	add_column :alarms, :minute, :integer
  end
end
