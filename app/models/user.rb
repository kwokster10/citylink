class User < ActiveRecord::Base
	has_many :payees
	has_many :activities
	has_secure_password
end
