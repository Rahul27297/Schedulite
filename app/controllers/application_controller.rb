class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception   
    before_action :authenticate
    
  @user_logged_in = 0

  def self.user_logged_in
    return @user_logged_in
  end

  def self.user_logged_in=(val)
    @user_logged_in = val
  end

  def authenticate 
      session_expiry
      update_activity_time
      token = session[:user]
      @user_signed_in = 0
      puts "token is #{token}"
      if !token.nil?
          decoded_token = JWT.decode(token, secret)
          payload = decoded_token.first
          user_id = payload["user_id"]
          user = User.find(user_id)
          if user.nil?
              render :template => "authentication/login"
          else
            @user_logged_in = 1
          end
      else
          render :template => "authentication/login"
      end
  end
    
  def get_user_id_from_session
      user_id = nil
      token = session[:user]
      if !token.nil?
          decoded_token = JWT.decode(token, secret)
          payload = decoded_token.first
          user_id = payload["user_id"]
          @user_logged_in = 1
      end
      user_id
  end
    
  def session_user_kill
      if session[:user]
          session.delete(:user)
      end
      reset_session
  end
    
  def session_expiry
      get_session_time_left
      puts "session expiery  #{@session_time_left}"
      unless @session_time_left > 0
          flash[:error] = "Your session has timed out. Please log back in."
          session_user_kill
      end
  end
    
  def update_activity_time
      session[:expires_at] = 5.minutes.from_now
      puts "session now expires at .. #{session[:expires_at]}"
  end
  
  def get_session_time_left
   expire_time = session[:expires_at] || Time.now  
   @session_time_left = (expire_time - Time.now).to_i
   puts "session time left  #{@session_time_left}"   
  end  
    
  def secret
      secret = ENV['secret_key_base'] || Rails.application.secrets.secret_key_base
  end
    
  def create_token(payload)
      JWT.encode(payload, secret)
  end   
end
