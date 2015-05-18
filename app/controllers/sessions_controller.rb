class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to 'user#show'
    end
  end

  def new
  end

  def destroy
  end
end


  # def create
  #   user = User.find_by(username: params[:username])

  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to secrets_path
  #   else
  #     @error = "username and password are not in system"
  #     render :new
  #   end
  # end

  # def destroy
  #   reset_session
  #   redirect_to new_session_path
  # end

#      Prefix Verb   URI Pattern            Controller#Action
#        root GET    /                      sessions#new
#     session POST   /session(.:format)     sessions#create
# new_session GET    /session/new(.:format) sessions#new
#             DELETE /session(.:format)     sessions#destroy
#        user POST   /user(.:format)        users#create
#             GET    /user(.:format)        users#show