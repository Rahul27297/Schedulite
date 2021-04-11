class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: [:login]
 
  def login
    username = params[:username]
    password = params[:password]
    @user = User.find_by(username: username)
    if (@user && @user.authenticate(password))
        payload = {user_id: @user.id}
        secret = ENV['secret_key_base'] || Rails.application.secrets.secret_key_base
        token = create_token(payload)
        session[:user] = token
        update_activity_time
        ApplicationController.user_logged_in = 1
        redirect_to courses_path
    else
      render :template => "authentication/login"
    end
  end
  
  
  def logout
      session_user_kill
      @user_logged_in = 0
      render :template => "authentication/login"
  end  
    
end
