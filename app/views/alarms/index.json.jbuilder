json.array!(@alarms) do |alarm|
  json.extract! alarm, :id, :name, :time, :days, :snooze
  json.url user_alarm_url(alarm, format: :json)
end
