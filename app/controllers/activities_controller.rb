class ActivitiesController < ApplicationController
  def show
    @activites = Activity.where(user_id: session[:user_id])
  end

  def paymentform
  	@activites = User.find(session[:user_id]).activites
  	@payee = Payee.all
  end
  
  def depositform
  	@activites = User.find(session[:user_id]).activites
  end

  def create 
  	if params[:deposit]
  		@activity = Activity.create(:desc: params[:desc], type: params[:type], amount: params[:deposit])
  	else
  		amount = -params[:payment].to_i
  		@activity = Activity.create(:desc: params[:desc], type: params[:type], amount: amount)
  	end
  	redirect_to activites_path
  end

  # private 
  # def activity_params
  # 	params.require(:activity).permit(:desc, :type, :amount)
  # end

end