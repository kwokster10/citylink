class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:username] = user.name
      redirect_to user_path
    else
      @email = params[:email]
      @error = "Unknown password/user"
      render :new
    end
  end

  def new
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end
end

