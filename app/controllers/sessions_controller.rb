require 'pry'
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in Successfully"
      session[:user_id] = user.id
      # binding.pry
      if user.role == "admin"
        redirect_to admin_users_path
      else
        redirect_to user_path(current_user)
      end
    else
      flash[:danger] = "Please enter valid credentials"
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged Out!"
    redirect_to login_path
  end


end
