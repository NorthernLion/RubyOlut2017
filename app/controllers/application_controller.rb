class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  def ensure_that_signed_in
    redirect_to signin_path, notice:'you should be signed in' if current_user.nil?
  end

  def ensure_that_admin
    redirect_to :back, notice:'you need to be admin to do stuff, unfair!' if !current_user.admin?
  end
/
  def ensure_that_not_blocked
    redirect_to signin_path, notice:'Your account has been suspended, acount can be unfrozen for 5€' if ?
  end
/
end