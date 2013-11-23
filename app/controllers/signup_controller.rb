class SignupController < ApplicationController
	def signup1
		session[:signup_first_name] = params[:first_name]
		session[:signup_last_name] = params[:last_name]
		session[:signup_email_address] = params[:email_address]
		session[:signup_zip_code] = params[:zip_code]
		session[:signup_password] = params[:password]

		redirect_to '/signup/2'
	end

	def select
		if session[:login] == true
			render 'cl_signup'
		else
			render 'dw_signup'
		end
	end
end
