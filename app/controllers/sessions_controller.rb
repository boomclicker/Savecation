class SessionsController < ApplicationController

  layout "creative"

  def index
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in"
      flash.now.alert = "welcome to Savecation"

    else
      flash.now.alert = "Email or password is invalid"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
