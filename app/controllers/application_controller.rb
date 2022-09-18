class ApplicationController < ActionController::Base
  private

  def not_authenticated
    flash[:danger] = t 'defaults.login_required'
    redirect_to login_path
  end
end
