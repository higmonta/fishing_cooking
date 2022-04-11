class ApplicationController < ActionController::Base
  private
  
  def not_authenticated
    flash[:danger] = "ログインが必要です"
    redirect_to login_path
  end
end
