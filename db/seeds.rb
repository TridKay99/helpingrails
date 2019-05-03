# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Star of Seeding..."
# Job.destroy_all
# 25.times do
#   params = {
#     title: Faker::Job.unique.title,
#     description: Faker::Job.field
#   }
#   puts "Creating Job # {params}"
#   job = Job.new(params)
#   job.save
# end

# puts "Seeding over.."

puts 'Creating a customer user'
customer = Customer.create({ :email => 'test@test.com.au', :password => '123456', :password_confirmation => '123456', :admin => false, moderator: false})
puts regular.email

puts 'Creating a worker user'
worker = Worker.create({ :email => 'moderator@moderator.com.au', :password => '123456', :password_confirmation => '123456', :admin => false, moderator: true})
puts regular.moderator

puts 'Creating books, authors and reviews'

10.times do 
  author_name = Faker::Book.author
  author = Author.create({name: author_name})
  5.times do
    title = Faker::Book.title
    description = Faker::Book.genre
    rating = rand(1..5)
    # author_id = author.id
    book = Book.new({title: title, description: description, rating: rating})
    book.author_id = author.id
    book.save

    3.times do
      book.reviews.create({title: Faker::Artist.name, review: Faker::Restaurant.review})
    end
  end
end

puts "Seeding Over"