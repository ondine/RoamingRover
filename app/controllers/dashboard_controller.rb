class DashboardController < ApplicationController
	def select
		if session[:user_type] == "client"
			render 'cl_dashboard'
		else
			render 'dw_dashboard'
		end
	end
end
