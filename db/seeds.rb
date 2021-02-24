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


renter = User.create!(
  email: 'renter@me.com',
  password: 'secret'
  )

owner = User.create!(
  email: 'owner@me.com',
  password: 'secret'
  )

  20.times do
    file = URI.open('https://www.reviewjournal.com/wp-content/uploads/2020/10/14359546_web1_halloween.costume-3.jpg?crop=1')
  costume = Costume.create!(
    name: Faker::Superhero.name,
    user: owner,
    category: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    price: rand(20..99)
    )
    costume.photo.attach(io: file, filename: 'diaDeLosMuertos.png', content_type: 'image/png')
puts "#{costume.name} was create!"
end
# file.rewind
puts "#{Costume.count} costumes were created, homeslizzle."
