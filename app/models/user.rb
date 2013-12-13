class User < ActiveRecord::Base
	validates :email, :user_type, :password, :address, :first_name, :last_name, :availability, :zipcode, presence: true
end