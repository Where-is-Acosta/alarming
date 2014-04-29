class ApplicationController < ActionController::Base
  include CurrentUser
  include MixcloudApi
  protect_from_forgery with: :exception
end
