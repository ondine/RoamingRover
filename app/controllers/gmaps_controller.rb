class GmapsController < ApplicationController
	def get_adds
		#Pull from activity model and push into array

		activities = Activity.all
		client_addresses = Hash.new

		#Loop through all activities to merge addresses into hash

		activities.each do |active|
			client_info = User.find(active.client_id)
			client_addresses.merge!({active.client_id => [client_info.address, client_info.first_name + " " + client_info.last_name, active.description]})
		end

		#Render out the JSON response

		addresses_response = client_addresses.as_json
		render :json => addresses_response
	end
end
