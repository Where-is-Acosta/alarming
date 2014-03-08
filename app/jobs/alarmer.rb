class AlarmerJob < Struct.new(:minute)
  def wake_up
    Alarm.this_hour.find_each do |alarm|
      #puts alarm.name " is going off this hour."
      WakeUpMailer.get_up(alarm).deliver
    end
    self.delay(:run_at => 1.minute.from_now).wake_up
  end
  def self.start_me_up
    new.wake_up
  end
end
Delayed::Job.enqueue AlarmerJob.new('Alarms the alarmee', Alarms.find.this_hour.collect(&:minute))
=begin
    if Time.now

    self.delay(:run_at => 1.minute.from_now).do_interesting_things
  end

  def self.start_me_up
    new.do_interesting_things
  end
end


    Delayed::Job.enqueue AlarmerJob.new('Alarms the alarmee', Alarms.find.today.collect(&:time))
=end