class ApplicationController < ActionController::Base
  include CurrentUser
  include MixcloudApi
  include NudgeClientApi
  
  protect_from_forgery with: :exception
end
