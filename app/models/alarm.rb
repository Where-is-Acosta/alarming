class Alarm < ActiveRecord::Base

  DAYS = %w[Mo Tu We Th Fr Sa Su]
  before_validation :hour, :minute, :set, on: :create
  validates :name, :days, :time, presence: true

  
  # For alarming people
  scope :set, -> { where(set: true)}
  scope :this_hour, -> { set.where(hour: Time.now.hour)}

  scope :next, ->  { set.where("hour <= ?", DateTime.now.hour) }

  def alarm_hour_now
    self[:time].hour
  end

  def days=(days)
    self[:days] = days.select { |day| DAYS.include?(day) }
  end

  protected

  def set
    days.each do |day|
      if day == DateTime.now.strftime("%A")
        self[:set] = true
      end
    end
  end

  def minute
    self.minute = self.time.min
  end

  def hour
    self.hour = self.time.hour
  end
end