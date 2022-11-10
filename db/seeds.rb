# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

puts "destroying everything!"

Post.destroy_all
User.destroy_all
Remark.destroy_all

puts "creating 3 users"
filepic1 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1666713742/rory_zoeandcam_a29pkj.jpg")
filepic2 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1666713742/rory_zoeandcam_a29pkj.jpg")
filepic3 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1666713742/rory_zoeandcam_a29pkj.jpg")

user1 = User.create(email: "test1@test.com", password: "123456", first_name: "Zoe", last_name: "Jackson", admin: true, author: true )
user1.photo.attach(io: filepic1, filename: "nes.png", content_type: "image/png")
user1.save!
user2 = User.create(email: "test2@test.com", password: "123456", first_name: "Rory", last_name: "Swinburne", admin: false, author: true )
user2.photo.attach(io: filepic2, filename: "nes.png", content_type: "image/png")
user2.save!
user3 = User.create(email: "test3@test.com", password: "123456", first_name: "Orla", last_name: "Fowler", admin: false, author: false )
user3.photo.attach(io: filepic3, filename: "nes.png", content_type: "image/png")
user3.save!

puts "created #{User.count} users"

post1 = Post.create(title: "Landscaper", address: "Newcastle", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "Outdoor")
file1 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986964/pexels-scott-webb-212942_pw1lp9.jpg")
post1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
post1.user = user1
post1.save!
post2 = Post.create(title: "Trader", address: "Amsterdam", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "Finance")
file2 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986954/pexels-energepiccom-159888_ghsubo.jpg")
post2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
post2.user = user1
post2.save!
post3 = Post.create(title: "Food Truck Owner", address: "Edinburgh", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "Hospitality")
file3 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986957/pexels-james-frid-2227960_uc1wvi.jpg")
post3.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
post3.user = user1
post3.save!
post4 = Post.create(title: "Freelance Artist", address: "Lisbon", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "The Arts")
file4 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986956/pexels-alicia-zinn-159984_ufnarm.jpg")
post4.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
post4.user = user1
post4.save!
post5 = Post.create(title: "Clothing Entrepeneur", address: "London", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "Business")
file5 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986955/pexels-terje-sollie-298863_v8ioxa.jpg")
post5.photo.attach(io: file5, filename: "nes.png", content_type: "image/png")
post5.user = user2
post5.save!
post6 = Post.create(title: "Yacht Chef", address: "Monaco", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "Hospitality")
file6 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986958/pexels-diego-f-parra-843633_lynsiz.jpg")
post6.photo.attach(io: file6, filename: "nes.png", content_type: "image/png")
post6.user = user2
post6.save!
post7 = Post.create(title: "Helicopter Pilot", address: "Aberdeen", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "Trade")
file7 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986955/pexels-jean-van-der-meulen-1549308_exzrxw.jpg")
post7.photo.attach(io: file7, filename: "nes.png", content_type: "image/png")
post7.user = user2
post7.save!
post8 = Post.create(title: "House Wife", address: "Falmouth", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", category: "Traditional")
file8 = URI.open("https://res.cloudinary.com/dfipoufmj/image/upload/v1667986956/pexels-anastasiya-gepp-3995914_snogon.jpg")
post8.photo.attach(io: file8, filename: "nes.png", content_type: "image/png")
post8.user = user2
post8.save!

# 30.times do
#   post = Post.create(
#     address: Faker::Address.country,
#     title: Faker::Name.name,
#     content: Faker::Lorem.paragraph(sentence_count: 5),
#     category: ["Team Sports", "Solo", "Extreme Sports"].sample
#   )
#   post.user = user1
#   post.save!
# end
