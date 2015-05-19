class PayeesController < ApplicationController
  def show 
  	@payees = Payee.all
  end

  def new
  end

  def create
  	@payee = Payee.create(name: params[:name], email: params[:email], user_id: session[:user_id])
  	# @payee[:user_id] = session[:user_id]
  	# @payee.save
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

       #      payees POST   /payees(.:format)             payees#create
       #  new_payees GET    /payees/new(.:format)         payees#new
       # edit_payees GET    /payees/edit(.:format)        payees#edit
       #             GET    /payees(.:format)             payees#show
       #             PATCH  /payees(.:format)             payees#update
       #             PUT    /payees(.:format)             payees#update
       #             DELETE /payees(.:format)             payees#destroy