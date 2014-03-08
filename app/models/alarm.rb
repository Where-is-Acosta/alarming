class Alarm < ActiveRecord::Base

  DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  before_validation :hour, :minute, on: :create
  validates :name, :days, :time, presence: true

  # For showing the alarms
  # scope :next, -> { where(hour: DateTime.now.strftime("%A"))}
  scope :next, ->  { where("hour <= ?", DateTime.now.hour).where.not(alarmed: true) }
  # For alarming people
  scope :this_hour, -> { where(hour: Time.now.hour)}


  def alarm_hour_now
    self[:time].hour
  end

  def days=(days)
    self[:days] = days.select { |day| DAYS.include?(day) }
  end

  protected
  def minute
    self.minute = self.time.min
  end

  def hour
    self.hour = self.time.hour
  end
end