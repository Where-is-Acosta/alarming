namespace :alarmer do
  desc "Deliver reminders to one day old users with no paid groups"
  task :wake_up => :environment do
    Alarm.this_hour.each do |alarm|
      puts alarm.id " is going off this hour."
      WakeUpMailer.get_up.deliver
    end
  end
end