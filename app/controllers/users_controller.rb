class UsersController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]
  def create
    if params[:password] != params[:confirm_password]
      @name = params[:name]
      @email = params[:email]
      @error = "Passwords don't match"
      render :new
      return
    end
    user = User.create(name: params[:name],email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:username] = user.name
    redirect_to user_path
  end

  def show
    @user = User.find(session[:user_id])
  end

end


