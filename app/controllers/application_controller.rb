class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :increment_counter
  before_action :authorize

  def increment_counter
  	if session[:counter].nil?
  		session[:counter] = 0
  	end

  	session[:counter] += 1

  end

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Пожалуйста, пройдите авторизацию"
    end
  end
end
