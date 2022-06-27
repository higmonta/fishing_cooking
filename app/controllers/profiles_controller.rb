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
      flash[:success] = "会員情報の変更に成功しました"
      redirect_to profile_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
