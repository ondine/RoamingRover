class DashboardController < ApplicationController
	def select
		if session[:login] == nil
			redirect_to '/login'
		else
			if session[:user_type] == "client"
				render 'cl_dashboard'
			else
				pull_dw_info()
				#Dog walker's zipcode
				render 'dw_dashboard'
			end
		end
	end

	def save_request
		new_request = Activity.new

		new_request.client_id = User.where(email: session[:email_address]).first.id
		new_request.title = params[:request_title]
		new_request.description = params[:request_description]
		new_request.date = params[:request_date]
		new_request.time = params[:request_time]
		new_request.rate = params[:request_pay]
		new_request.status = "pending"

		#Save it
		new_request.save

		render 'cl_dashboard'
	end

	#Get dog walker custom data

	def pull_dw_info
		@dw_zip = User.where(email: session[:email_address]).first.zipcode

		@dog_listings = Activity.all
	end
end
