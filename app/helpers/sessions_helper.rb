

module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end
end

/#module SessionsHelper
  def sign_in(user)
   
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attributes(remember_token => User.encrypt(remember_token))
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
    
    if !@current_user.nil?
      flash[:msg] = remember_token.to_s
    end 
  end
  
  def signed_in?
    if current_user.nil?
      flash[:error] = "-hey baby there is no user now-"
    else
      flash[:success] = "now we have user in"
    end
    return !current_user.nil?
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
end
#/