# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Testing...."
puts "Testing..."
puts "Cleaning up db"
Costume.destroy_all
puts "Db is clean"

20.times do |costume|
  costume = Costume.create(
    name: Faker::Superhero.name,
    user: User.find(1),
    category: Faker::Superhero.suffix,
    description: Faker::Superhero.descriptor,
    price: rand(20..99)
  )
puts costume.price
puts "#{costume.name} was create!"
end

puts "#{Costume.count} costumes were created, homeslizzle."
