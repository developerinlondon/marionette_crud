# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'Users'
x = 0
((1..1000).map{|iter| x += rand(100000)}.shuffle).each do |i|
  user = User.create({:username => 'username' << i.to_s, :first_name => 'first_name' << i.to_s , :last_name => 'last_name' << i.to_s , :age => i%30+20, :email => 'abc' << i.to_s << '@abc.com'})
  puts 'user: ' << user.id.to_s << ' created'
end