class SignupController < ApplicationController
	def select
		render 'dw_signup'
	end

	def signup1
		new_user = User.new
		new_user.name = params[:first_name] + " " + params[:last_name]
		new_user.email = params[:email_address]
		new_user.save

		redirect_to '/signup/2'
	end
end
