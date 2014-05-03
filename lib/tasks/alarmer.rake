require "#{Rails.root}/app/controllers/concerns/Mixcloud_Api.rb"
include MixcloudApi
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
    sound = get_the_popular_one
    loop {
    Alarm.this_hour.find_each do |alarm|
      if alarm.minute == Time.now.min
        if alarm.set == true
          puts alarm.name + " is going off. With " + sound + " this mix"
          alarm.update_attributes(:set => false)
        end
      end
    end
    puts Time.now + Time.now.min
    puts sound
    sleep(30.seconds)
  }
  end
end