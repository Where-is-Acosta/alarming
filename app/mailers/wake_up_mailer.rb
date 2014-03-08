class WakeUpMailer < ActionMailer::Base
  default from: "get_up@alarming.com"

  def get_up(alarm)
    @alarm = alarm
    #@token = Mixtable::MessageVerifier.generate(user.profile.email)
    mail(to: "sinan@mixtable.com", subject: "Get Up!")
  end

end
