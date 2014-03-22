module AlarmHelper

  def list_days
    Alarm::DAYS.map do |d|
      [d, ]
    end
  end
end
