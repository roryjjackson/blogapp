# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require "faker"

puts "destroying everything!"

Post.destroy_all
User.destroy_all
Remark.destroy_all
Like.destroy_all

puts "creating 3 users"

user1 = User.create(email:"test1@test.com", password: "123456", first_name: "Zoe", last_name:"Jackson", admin: true, author: true )
user2 = User.create(email:"test2@test.com", password: "123456", first_name: "Rory", last_name:"Swinburne", admin: false, author: true )
user3 = User.create(email:"test3@test.com", password: "123456", first_name: "Orla", last_name:"Fowler", admin: false, author: false )

puts "created #{User.count} users"

30.times do
  post = Post.create(
    address: Faker::Address.country,
    title: Faker::Name.name,
    content: Faker::Lorem.paragraph(sentence_count: 5),
    category: ["Team Sports", "Solo", "Extreme Sports"].sample
  )
  post.user = user1
  post.save!
end
