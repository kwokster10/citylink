class PayeesController < ApplicationController

  def new

  end

  def create
  	@payee = Payee.create(payee_params)
  	redirect_to activities_payment_path
  end

  def edit 
  end

  def update
  end
  
  private 
  def payee_params
  	params.require(:user).permit(:name, :email)
  end
end

       #      payees POST   /payees(.:format)             payees#create
       #  new_payees GET    /payees/new(.:format)         payees#new
       # edit_payees GET    /payees/edit(.:format)        payees#edit
       #             GET    /payees(.:format)             payees#show
       #             PATCH  /payees(.:format)             payees#update
       #             PUT    /payees(.:format)             payees#update
       #             DELETE /payees(.:format)             payees#destroy