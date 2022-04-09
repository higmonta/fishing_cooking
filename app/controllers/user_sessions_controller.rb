class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to "#"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end
end
