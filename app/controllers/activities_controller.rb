class ActivitiesController < ApplicationController
  def show
    @activites = Activity.where(user_id: session[:user_id])
  end

  def paymentform
  end
  
  def depositform
  end
end