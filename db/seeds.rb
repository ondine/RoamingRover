# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'bcrypt'

#Create 5 dog walkers
6.times do |i|
	if i == 0
		next
	end
	new_password = BCrypt::Password.create("password#{i}")
	User.create(email: "test-walker#{i}@test.com", phone: "8053381903", user_type: "walker", password: new_password, address: "#{i}01 Montgomery st, san francisco, CA", first_name: "Test#{i}", last_name: "User", availability: "Always", zipcode: "94134")
end

#Create 5 clients
6.times do |i|
	if i == 0
		next
	end
	new_password2 = BCrypt::Password.create("password#{i}")
	User.create(email: "test-client#{i}@test.com", phone: "8053381903", user_type: "client", password: new_password2, address: "#{i}01 Montgomery st, san francisco, CA", first_name: "Test#{i}", last_name: "User", availability: "Always", zipcode: "94134")
end

#Add 5 walkers
6.times do |i|
	if i == 0
		next
	end
	DogWalker.create(breeds: "All breeds!", experience: "5 Years", rate: "100 per day with expenses", user_id: i)
end

#Add 5 clients
6.times do |i|
	if i == 0
		next
	end
	Client.create(dogsize: "3", user_id: i)
end

#Add 5 activities
6.times do |i|
	if i == 0
		next
	end
	Activity.create(title: "This is a great title! #{i}", description: "This is a great description! #{i}", client_id: i, rate: "50 per day", date: "2013-12-21", time: "14:00", status: "pending")
end