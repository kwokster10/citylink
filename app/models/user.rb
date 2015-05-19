class User < ActiveRecord::Base
	has_many :payees
	has_many :activities
	has_secure_password

	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	validates_confirmation_of :password
	 validates_length_of :name, within: 4..20, too_long: 'pick a shorter name', too_short: 'pick a longer name'

  after_initialize :init

  def init
    self.balance  ||= 0.0           #will set the default value only if it's nil
  end
end
