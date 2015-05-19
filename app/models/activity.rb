class Activity < ActiveRecord::Base
	belongs_to :users

	validates_presence_of :desc
	validates_presence_of :kind
	validates_presence_of :amount
	validates_presence_of :user_id
end
