class AddAlarmedToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :alarmed, :boolean, default: false
  end
end
