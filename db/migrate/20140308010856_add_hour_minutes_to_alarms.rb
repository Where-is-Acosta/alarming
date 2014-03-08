class AddHourMinutesToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :hour, :int
    add_column :alarms, :minute, :int
  end
end
