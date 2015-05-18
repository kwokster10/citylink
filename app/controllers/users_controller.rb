class UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confirm]
      erb :new, locals: {user: params, error: "Passwords don't match"}
      return
    end
    user = User.create(user_params);
    redirect_to 'sessions#new'
  end

  private
    def user_login
      params.require(:user).permit(:name,:email,:password_digest);
    end
end



#      Prefix Verb   URI Pattern            Controller#Action
#        root GET    /                      sessions#new
#     session POST   /session(.:format)     sessions#create
# new_session GET    /session/new(.:format) sessions#new
#             DELETE /session(.:format)     sessions#destroy
#        user POST   /user(.:format)        users#create
#             GET    /user(.:format)        users#show