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

	def send_proposal
		#Save the proposal on AJAX request

		new_prop = WalkerBids.new

		new_prop.walker_id = session[:user_id]
		new_prop.bid_id = params[:proposalId]

		#Save it up

		new_prop.save

		#Get client ID

		client_id_listed = Activity.where(id: params[:proposalId]).first.client_id

		#Set up walker information provided in email

		given_name = session[:first_name] + " " + session[:last_name]

		if params[:sharePhone] == "yes"
			walker_phone = session[:phone_number]
		else
			walker_phone = "No number provided"
		end

		walker_email = session[:email_address]

		#Send out email

		UserMailer.proposal_email(User.where(id: client_id_listed).first, params[:propRate], params[:proposalDesc], given_name, walker_phone, walker_email).deliver

		#Send back AJAX response

		render :text => "ok"
	end
end
