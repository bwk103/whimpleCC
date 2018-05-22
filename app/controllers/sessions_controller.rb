class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p params
    @user = User.find_by(username: params[:user][:username])
    p @user
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
