# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Star of Seeding..."
Job.destroy_all
25.times do
  params = {
    title: Faker::Job.unique.title,
    description: Faker::Job.field
  }
  puts "Creating Job # {params}"
  job = Job.new(params)
  job.save
end

puts "Seeding over.."