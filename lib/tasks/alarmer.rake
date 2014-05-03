require "#{Rails.root}/app/controllers/concerns/nudge_client_api.rb"
include NudgeClientApi

namespace :alarmer do

  desc "Set todays alarms"
  task :set_alarms => :environment do
    Alarm.all.each do |alarm|
      alarm.days.each do |day|
        if day == DateTime.now.strftime("%A")
          alarm.update_attributes(:set => true)
        end
      end
    end
  end

  desc "Deliver reminders to one day old users with no paid groups"
  task :wake_up => :environment do
    loop {
    Alarm.this_hour.find_each do |alarm|
      if alarm.minute == Time.now.min
        if alarm.set == true
          puts alarm.user.name + "'s alarm: " + alarm.name + " is going off."
          send_alarm_to_client(alarm.user, alarm)
          alarm.update_attributes(:set => false)
        end
      end
    end
    puts Time.now + Time.now.min
    sleep(30.seconds)
  }
  end
end