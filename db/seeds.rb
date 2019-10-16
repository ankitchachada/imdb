# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = %w[Anime Comedy Drama Fantasy Horror Thriller]

genres.each do |genre|
 	Genre.create(name: genre)
end

users = ["admin@example.com", "ankit@gmail.com"]

users.each do |u|
	user = User.new(email: u, password: "12345678")
	user.role = "admin" if u == "admin@example.com"
	user.save
end

movies = ["HP","LOTR","ROR","Sinatra"]

movies.each do |movie|
	Movie.create(title: movie, description: "Lorem ipsum", genre_id:1)
end