class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if request.env["omniauth.auth"]
      user = User.from_omniauth(request.env["omniauth.auth"])

      if user.valid?
        session[:user_id] = user.id
        redirect_to events_path
      end
    else
      user = User.find_by(email: params[:user][:email])
      
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to events_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
