class PasswordResetsController < ApplicationController
  # In Rails 5 and above, this will raise an error if
  # before_action :require_login
  # is not declared in your ApplicationController.
    
  # request password reset.
  # you get here when the user entered their email in the reset password form and submitted it.

  def new; end

  def create
    @user = User.find_by(email: params[:email])
        
    # This line sends an email to the user with instructions on how to reset their password (a url with a random token)
    @user.deliver_reset_password_instructions! if @user
        
    # Tell the user instructions have been sent whether or not email was found.
    # This is to not leak information to attackers about which emails exist in the system.
    if logged_in?
      flash.now[:success] = t '.success_message'
      render template: 'profiles/show'
    else
      flash[:success] = t '.success_message'
      redirect_to login_path
    end
  end
    
  # This is the reset password form.
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      not_authenticated
      return
    end
  end
      
  # This action fires when the user has sent the reset password form.
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      not_authenticated
      return
    end

    # the next line makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confirmation]
    # the next line clears the temporary token and updates the password
    if @user.change_password(params[:user][:password])
      flash[:success] = t '.success_message'
      redirect_to login_path
    else
      render :action => "edit"
    end
  end
end