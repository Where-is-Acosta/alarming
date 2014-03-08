class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :name
      t.time :time
      t.string :days, array: true
      t.boolean :snooze

      t.timestamps
    end
  end
end
