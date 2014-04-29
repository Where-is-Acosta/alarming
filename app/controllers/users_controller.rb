class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_user, :require_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def authorize_mixcloud
    redirect_to "https://www.mixcloud.com/oauth/authorize?client_id=#{MIXCLOUD_CREDENTIALS[:client]}&redirect_uri=#{auth_mixcloud_callback_url}"
  end

  def mixcloud_callback
    redirect_to "https://www.mixcloud.com/oauth/access_token?client_id=#{MIXCLOUD_CREDENTIALS[:client]}&redirect_uri=#{auth_mixcloud_save_url}&client_secret=#{MIXCLOUD_CREDENTIALS[:secret]}&code=#{params[:code]}"
  end

  def save_mixcloud_auth_token
    @user.mixcloud_auth_token = params[:access_token]
    @user.save
    render 'show', @user
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        non_devise_sign_in(@user)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = current_user
    end
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
