class User < ActiveRecord::Base
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, uniqueness: true

	has_secure_password
	validates :password, presence: true, length: 8..30

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end


end
