class User < ActiveRecord::Base
	has_many :payees
	has_many :activities
	has_secure_password

  after_initialize :init

  def init
    self.balance  ||= 0.0           #will set the default value only if it's nil
  end
end
