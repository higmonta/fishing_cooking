class UsersController < ApplicationController
  before_action :require_login, only: %i[show edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t '.success_message'
      redirect_to login_path
    else
      flash.now[:danger] = t '.error_message'
      render :new
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @user.attributes = profile_params
    if @user.save(context: :not_password_validation)
      flash[:success] = t '.success_message'
      redirect_to profile_path
    else
      flash.now[:danger] = t '.error_message'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def profile_params
    params.require(:user).permit(:name, :email)
  end
end
