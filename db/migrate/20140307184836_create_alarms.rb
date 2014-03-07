class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string   :name, default: "Alarm"
      t.time     :time
      t.string   :days, array: true
      t.boolean  :snooze, default: false
      t.string   :sound
      t.timestamps
    end
  end
end
