module AlarmHelper

  def list_days
    Alarm::DAYS.map do |day|
      [day]
    end
  end
end
