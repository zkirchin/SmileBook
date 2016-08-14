# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

usernames = ["sk8rboi88", "PinkPiggy34", "lilGilly89", "Lolzzzz", "IluvLyfe"]

emails = ["goodstudent1@gmail.com", "goodstudent2@gmail.com", "goodstudent3@gmail.com", "goodstudent4@gmail.com", "goodstudent5@gmail.com"]

5.times do |x|
  User.create(username: usernames[x], email: emails[x], password: "password", password_confirmation: "password")
end

puts "Test users created"
