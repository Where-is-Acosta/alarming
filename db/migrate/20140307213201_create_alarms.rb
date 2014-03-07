class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.text :name
      t.time :time
      t.text :days
      t.boolean :snooze

      t.timestamps
    end
  end
end
