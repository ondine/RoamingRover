class SignupController < ApplicationController
	def select
		if session[:type] == 1
			render 'cl_signup'
		elsif session[:type] == 2
			render 'dw_signup'
		end
	end

	def signup1
		session[:signup_first_name] = params[:first_name]
		session[:signup_last_name] = params[:last_name]
		session[:signup_email_address] = params[:email_address]

		redirect_to '/signup/2'
	end
end
