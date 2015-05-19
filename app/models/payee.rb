class Payee < ActiveRecord::Base
	belongs_to :users
	
	validates_presence_of :name
	validates_presence_of :email
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
