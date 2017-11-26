class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Savecation!!"
      redirect_to user_url(@user.id)

    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.isAdmin
      @users = User.all
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
