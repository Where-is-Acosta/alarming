class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      non_devise_sign_in(user)
      redirect_to user
    else
      redirect_to root_url
    end
  end
  def destroy
    non_devise_sign_out
    redirect_to root_path
  end
end
