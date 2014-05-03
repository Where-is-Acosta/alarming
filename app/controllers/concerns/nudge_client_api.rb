require "#{Rails.root}/app/controllers/concerns/mixcloud_api.rb"
include MixcloudApi
module NudgeClientApi
  extend ActiveSupport::Concern

  def send_alarm_to_client(user, alarm)
  	client_url = user.client_address + ":5454"
  	RestClient.get(client_url, {:params => {:name => alarm.name, :minute => alarm.minute, :time => alarm.time.strftime("%l:%M%P"), :mix => get_the_popular_one}})
  end
end