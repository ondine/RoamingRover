class LoginController < ApplicationController
	def read
		render 'login'
	end

	def write
		auth_user = User.where(email: params[:login_email]).where(password: params[:login_password]).first
		if auth_user == nil
			render 'login'
		else
			session[:email_address] = auth_user.email
			session[:user_type] = auth_user.user_type
			session[:user_id] = auth_user.id
			session[:login] = true
			redirect_to '/dashboard'
		end
	end

	def logout
		session[:login] = nil
		@logout = true
		render 'login'
	end
end
