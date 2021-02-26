# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Testing...."
puts "Testing..."
puts "Cleaning up db"
Costume.destroy_all
User.destroy_all
puts "Db is clean"


# renter = User.create!(
#   email: 'renter@me.com',
#   password: 'secret',
#   address: 'Tokyo Tower'
#   )

# owner = User.create!(
#   email: 'owner@me.com',
#   password: 'secret',
#   address: 'Tokyo Skytree'
#   )

# randomGuy = User.create!(
#   email: 'randomguy@me.com',
#   password: 'secret',
#   address: 'Yoyogi Park'
#   )

# randomGuy2 = User.create!(
#   email: 'randomguy2@me.com',
#   password: 'secret',
#   address: 'Roppongi Hills'
#   )

# array = [renter, owner, randomGuy, randomGuy2]

#   20.times do
#     file = URI.open('https://www.reviewjournal.com/wp-content/uploads/2020/10/14359546_web1_halloween.costume-3.jpg?crop=1')
#     costume = Costume.create!(
#     name: Faker::Superhero.name,
#     user: array.sample,
#     category: Costume::CATEGORIES.sample,
#     description: Faker::Commerce.product_name,
#     price: rand(20..99)
#     )
#     costume.photo.attach(io: file, filename: 'diaDeLosMuertos.png', content_type: 'image/png')
# puts "#{costume.name} was create!"
# end
# # file.rewind!

# puts "#{Costume.count} costumes were created, homeslizzle."

5.times do
  user_image = URI.open('https://thispersondoesnotexist.com/image')
  user = User.create!(
    email: Faker::Internet.safe_email,
    password: 'secret',
    address: User::ADDRESSES.sample # needs to be 6 digits,
    # add any additional attributes you have on your model
    )
    user.photo.attach(io: user_image, filename: 'user.png', content_type: 'image/png')

  print '>'



  2.times do
    costume_image = URI.open('https://images-na.ssl-images-amazon.com/images/I/71HOseQFS2L._AC_SL1500_.jpg')
    costume = Costume.create!(
    name: Faker::Superhero.name,
    user: user,
    category: Costume::CATEGORIES.sample,
    description: Faker::Commerce.product_name,
    price: rand(20..99)
    )
    costume.photo.attach(io: costume_image, filename: 'diaDeLosMuertos.png', content_type: 'image/png')


  puts "#{costume.name} was create!"

    rand(3).times do
      Review.create!(
        content: Faker::Restaurant.review,
        costume: costume,
        rating: rand(1..5)
      )
      print '>'
    end
  end
end
puts "#{User.count} users were created, homeslice."
puts "#{Costume.count} costumes were created, homeslizzle."
