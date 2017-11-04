class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path(@user.id), notice: 'Welcome to Savecation!!'

    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @adminStatus = @user.isAdmin
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
