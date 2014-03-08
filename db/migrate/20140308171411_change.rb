class Change < ActiveRecord::Migration
  def up
    remove_column :alarms, :alarmed
    add_column :alarms, :set, :boolean, default: false
  end
  def down
    add_column :alarms, :alarmed, :boolean, default: false
    remove_column :alarms, :set
  end
end
