=begin

class AlarmerJob < Struct.new(:time)
  def do_interesting_things
    if Time.now

    self.delay(:run_at => 1.minute.from_now).do_interesting_things
  end

  def self.start_me_up
    new.do_interesting_things
  end
end


    Delayed::Job.enqueue AlarmerJob.new('Alarms the alarmee', Alarms.find.today.collect(&:time))
=end