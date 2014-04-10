module CurrentUser
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:user_id])
  end

  def non_devise_sign_in(user)
    user_id = user.respond_to?(:id) ? user.id : user
    session[:user_id] = user_id
  end

  def non_devise_sign_out
    session[:user_id] = nil
  end

  def require_user
    redirect_to root_path, notice: "You must be logged in to access this page" if current_user.blank?
  end

  def require_no_user
    redirect_to dashboard_path if current_user.present?
  end
end
