namespace :alarmer do
  desc "Deliver reminders to one day old users with no paid groups"
  task :wake_up => :environment do
    loop {
    Alarm.this_hour.find_each do |alarm|
      if alarm.minute = Time.now.min
        if alarm.alarmed == false
      #puts alarm.name " is going off this hour."
          WakeUpMailer.get_up(alarm).deliver
          alarm.update_attributes(:alarmed => true)
        end
      end
    end
    puts Time.now.min
    sleep(30.seconds)
  }
  end
end