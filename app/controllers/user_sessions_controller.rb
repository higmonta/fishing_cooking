class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = t '.success_message'
      redirect_to cooking_memories_path
    else
      flash.now[:danger] = t '.error_message'
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = t '.success_message'
    redirect_to root_path
  end
end
