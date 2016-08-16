# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

usernames_array = ["sk8rboi88", "tomCruise", "Iluvlyfe", "zackIsHandsome", "soIsBart"]
email_array = ["student1@gmail.com", "student2@gmail.com", "student3@gmail.com", "student4@gmail.com", "student5@gmail.com"]

5.times do |x|
	User.create(username: usernames_array[x], email: email_array[x], password: "password", password_confirmation: "password")
end

puts "Test users have been created"













