class ProfilesController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:success] = t '.success_message'
      redirect_to profile_path
    else
      flash.now[:danger] = t '.error_message'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
