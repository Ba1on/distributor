class SessionController < ApplicationController
  skip_before_action :authorize

  def create
    user = User.where(name: params[:name]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to issues_url
    else
      redirect_to login_url, alert: t('.incorrect_user_name_or_pass')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, notice: t('.session_completed')
  end
end
