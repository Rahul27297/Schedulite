class AuthenticationController < ApplicationController
  skip_before_action :authenticate, only: [:login]
 
  def login
    username = params[:username]
    password = params[:password]
    @user = User.find_by(username: username)
    puts "user is found, #{@user}"
    puts "user is found, #{@user}"  
    if (@user && @user.authenticate(password))
        payload = {user_id: @user.id}
        secret = ENV['secret_key_base'] || Rails.application.secrets.secret_key_base
        token = create_token(payload)
        session[:user] = token
        puts "increasing the session time"  
        update_activity_time
        redirect_to courses_path
    else
      render :template => "authentication/login"
    end
  end
  
  
  def logout
      session_user_kill
      render :template => "authentication/login"
  end  
    
end
