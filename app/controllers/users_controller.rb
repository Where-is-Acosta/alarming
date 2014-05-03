class UsersController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def show
    # Queries api for popular mix
    @sound = get_the_popular_one
  end

  def edit
    @user = current_user
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
