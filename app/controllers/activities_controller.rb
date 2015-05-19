class ActivitiesController < ApplicationController
  def show
    @activities = Activity.where(user_id: session[:user_id])
  end

  def paymentform
  	@activities = User.find(session[:user_id]).activities
  	@payee = Payee.all
  end
  
  def depositform
  	@activities = User.find(session[:user_id]).activities
  end

  def create 
  	if params[:deposit]
  		@activity = Activity.create(desc: params[:desc], type: params[:type], amount: params[:deposit])
  	else
  		amount = -params[:payment].to_i
  		@activity = Activity.create(desc: params[:desc], type: params[:type], amount: amount)
  	end
  	redirect_to activities_path
  end

  # private 
  # def activity_params
  # 	params.require(:activity).permit(:desc, :type, :amount)
  # end

end