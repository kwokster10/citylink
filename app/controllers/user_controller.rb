class UserController < ApplicationController
  def 'create'
  end
end



# Evans-MacBook-Pro:citylink sleepylemur$ rake routes
#      Prefix Verb   URI Pattern            Controller#Action
#     session POST   /session(.:format)     sessions#create
# new_session GET    /session/new(.:format) sessions#new
#             DELETE /session(.:format)     sessions#destroy
#        user POST   /user(.:format)        users#create
# Evans-MacBook-Pro:citylink sleepylemur$ rake routes
#      Prefix Verb   URI Pattern            Controller#Action
#        root GET    /                      session#new
#     session POST   /session(.:format)     sessions#create
# new_session GET    /session/new(.:format) sessions#new
#             DELETE /session(.:format)     sessions#destroy
#        user POST   /user(.:format)        users#create