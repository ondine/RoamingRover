require 'bcrypt'

class SignupController < ApplicationController
	include BCrypt

	def select
		#Select which signup page to show based on type

		if session[:user_type] == "client"
			render 'cl_signup'
		elsif session[:user_type] == "walker"
			render 'dw_signup'
		else
			raise ActionController::RoutingError.new('Not Found')
		end
	end

	def set_user_type
		#AJAX set and return for user type

		session[:user_type] = params[:signupType]
		render :text => 'ok'
	end

	def signup2
		#Set up session variables for later recording

		session[:signup_first_name] = params[:first_name]
		session[:signup_last_name] = params[:last_name]
		session[:signup_email_address] = params[:email_address]
		session[:signup_zip_code] = params[:zip_code]
		session[:signup_password] = params[:password]

		redirect_to '/signup/3'
	end

	def signup3
		#Set up session variables for recording, and then record!

		session[:signup_address] = params[:address]
		session[:signup_phone] = params[:phone_number]
		session[:signup_avail] = params[:avail]

		#Set up model and set data to be dumped into database
		new_user = User.new

		new_user.user_type = session[:user_type]
		new_user.first_name = session[:signup_first_name]
		new_user.last_name = session[:signup_last_name]
		new_user.email = session[:signup_email_address]
		new_user.phone = session[:signup_phone]
		new_user.address = session[:signup_address]
		new_user.zipcode = session[:signup_zip_code]
		new_user.availability = session[:signup_avail]

		#Generate secure password

		new_password = BCrypt::Password.create(session[:signup_password])

		new_user.password = new_password

		#Save it up!
		new_user.save

		new_user_id = new_user.id

		if session[:user_type] == "client"
			session[:signup_dogsize] = params[:dogsize]
			
			#Save to DB
			new_client = Client.new
			new_client.user_id = new_user_id
			new_client.dogsize = session[:signup_dogsize]
			new_client.save
		elsif session[:user_type] == "walker"
			session[:signup_breeds] = params[:breeds]
			session[:signup_exp] = params[:years_exp]
			session[:signup_rate] = params[:rate]

			#Save to DB
			new_dw = DogWalker.new
			new_dw.user_id = new_user_id
			new_dw.breeds = session[:signup_breeds]
			new_dw.experience = session[:signup_exp]
			new_dw.rate = session[:signup_rate]
			new_dw.save
		end

		#Redirect out
		redirect_to '/login/'
	end
end
