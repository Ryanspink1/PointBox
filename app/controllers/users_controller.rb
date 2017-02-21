class UsersController < ApplicationController

  def show
    @redeemed = current_user.points
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You successfully created a new user!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end



private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
