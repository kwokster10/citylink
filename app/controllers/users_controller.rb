

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
    redirect_to user_path
  end

  def show
    @user = User.find(session[:user_id])
  end

  # private
  #   def user_login
  #     params.require(:user).permit(:name,:email,:password_digest);
  #   end
end



#      Prefix Verb   URI Pattern            Controller#Action
#        root GET    /                      sessions#new
#     session POST   /session(.:format)     sessions#create
# new_session GET    /session/new(.:format) sessions#new
#             DELETE /session(.:format)     sessions#destroy
#        user POST   /user(.:format)        users#create
#             GET    /user(.:format)        users#show