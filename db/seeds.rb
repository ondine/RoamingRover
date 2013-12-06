# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create 5 dog walkers
5.times do |i|
	User.create(email: "test-walker#{i}@test.com", phone: "8053381903", user_type: "walker", password: "password", address: "601 Montgomery st, san francisco, CA", first_name: "Test#{i}", last_name: "User", availability: "Always", zipcode: "94134")
end

#Create 5 clients
5.times do |i|
	User.create(email: "test-client#{i}@test.com", phone: "8053381903", user_type: "client", password: "password", address: "601 Montgomery st, san francisco, CA", first_name: "Test#{i}", last_name: "User", availability: "Always", zipcode: "94134")
end

#Add 5 walkers
5.times do |i|
	DogWalker.create(breeds: "All breeds!", experience: "5 Years", rate: "100 per day with expenses", user_id: i)
end

#Add 5 clients
5.times do |i|
	Client.create(dogsize: "3", user_id: i)
end

#Add 5 activities
5.times do |i|
	Activity.create(title: "This is a great title! #{i}", description: "This is a great description! #{i}", client_id: i, rate: "50 per day", date: "2013-12-21", time: "14:00", status: "pending")
end