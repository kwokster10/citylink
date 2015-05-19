class PayeesController < ApplicationController
  def show 
  	@payees = Payee.all
  end

  def new
  end

  def create
  	@payee = Payee.create(name: params[:name], email: params[:email], user_id: session[:user_id])
  	redirect_to activities_payment_path
  end

  def edit
  	@payee = Payee.find(params[:format])
  end

  def update
  	@payee = Payee.find(params[:id])
  	@payee.update(name: params[:name], email: params[:email])
  	redirect_to payees_path
  end

  def destroy 
  	@payee = Payee.find(params[:format])
  	@payee.destroy
  	redirect_to payees_path
  end
end

  