class GmapsController < ApplicationController
	def get_adds
		#Pull from activity model and push into array

		activities = Activity.all
		client_addresses = Array.new

		activities.each do |active|
			client_info = User.find(active.client_id)
			client_addresses << client_info.address
		end

	end
end
