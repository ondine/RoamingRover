class LoginController < ApplicationController
	def read
		render 'login'
	end

	def write
		auth_user = User.where(email: params[:login_email]).where(password: params[:login_password]).first
		if auth_user == nil
			render 'login'
		else
			#Set up our session variables

			session[:email_address] = auth_user.email
			session[:user_type] = auth_user.user_type
			session[:user_id] = auth_user.id
			session[:first_name] = auth_user.first_name
			session[:last_name] = auth_user.last_name
			session[:phone_number] = auth_user.phone
			session[:zip_code] = auth_user.zipcode
			session[:login] = true
			redirect_to '/dashboard/' + session[:zip_code].to_s
		end
	end

	def logout
		session[:login] = nil
		@logout = true
		render 'login'
	end
end
