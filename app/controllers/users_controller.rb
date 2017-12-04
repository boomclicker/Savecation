class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user.id), notice: 'Welcome to Savecation!!'

    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.isAdmin
      @users = User.all
    end

    @schedules = @user.schedules
    puts @schedules
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
