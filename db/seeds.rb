# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Star of Seeding..."

Customer.destroy_all
Worker.destroy_all
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

# puts "Seeding over.."

puts 'Creating a customer user'
3.times do 
  customer = Customer.create({firstname: Faker::Name.first_name,               
    lastname:  Faker::Name.last_name, username:  Faker::Name.first_name , password: '123456', 
    email: Faker::Internet.email
  })
  3.times do 
    customer.jobs.create(description: Faker::Job.field, title: Faker::Job.unique.title, price: rand(60..100))
    customer.customer_reviews.create({content: Faker::Artist.name, description: Faker::Restaurant.review})
  end

end

puts "customer user done"

puts 'Creating a worker user'
3.times do 
  worker = Worker.create({firstname: Faker::Name.first_name,               
    lastname:  Faker::Name.last_name, username:  Faker::Name.first_name , password: '123456', 
    email: Faker::Internet.email, experience: Faker::Construction.trade
  })
  # 3.times do
  #   worker.worker_reviews.create({content: Faker::Artist.name, description: Faker::Restaurant.review}) 
  # end
end
puts "customer user done"


puts "Seeding Over"