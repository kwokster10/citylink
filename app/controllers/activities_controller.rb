class ActivitiesController < ApplicationController
  def show
    @activities = Activity.where({user_id: session[:user_id]})
  end

  def paymentform
  	@activities = User.find(session[:user_id]).activities
  	@payees = Payee.all
  end
  
  def depositform
  	@activities = User.find(session[:user_id]).activities
  end

  def create 
  	if params[:deposit]
      amount = params[:deposit].to_f
  		@activity = Activity.create(desc: params[:desc], kind: params[:kind], amount: params[:deposit], user_id: session[:user_id])
  	else
  		amount = -params[:payment].to_f
  		@activity = Activity.create(desc: params[:desc], kind: params[:kind], amount: amount, user_id: session[:user_id])
  	end

    if @activity.save
      flash[:success] = "Check out your new activity!"
      user = User.find(session[:user_id]);
      user.update(balance: user.balance+amount);
      redirect_to activities_path
    else 
      flash[:error] = "Hmm, please check your inputs."
      redirect_to activities_payment_path
    end
  end

end