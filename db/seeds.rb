# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'destroying current records'

Review.destroy_all
Booking.destroy_all
Service.destroy_all
Client.destroy_all
Contractor.destroy_all
User.destroy_all

puts 'destroyed'


puts 'seeding'

10.times do

  # create 10 users
  userInstance = User.new( {first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: Faker::Internet.password} )
  userInstance.remote_avatar_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI8C4r18JoraIL5qyaRuzh8DFKQrnAEMszI_nHq7Nk3rohuz4QeQ'
  # make each user a client and contractor
  clientInstance = Client.new
  clientInstance.user = userInstance
  clientInstance.save
  contractorInstance = Contractor.new
  contractorInstance.user = userInstance
  contractorInstance.save

  # give each contractor a service they offer
  serviceInstance = Service.new( {name: Faker::Job.title,
                 description: Faker::ChuckNorris.fact,
                 price: rand(1000..10000),
                 location: Faker::Address.city,
                 category: Faker::Job.field} )
  serviceInstance.contractor = contractorInstance
  serviceInstance.remote_photo_url = 'https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/tHF1OBF/4k-organized-criminal-gangsters-in-dark-parking-lot-doing-a-drug-deal_h7fugeodye_thumbnail-full01.png'
  serviceInstance.save

  # sleep(10)
  puts 'sleeping'
  # create 20 random bookings and assign a random service and client
  2.times do
  bookingInstance = Booking.new( {date: Faker::Date.forward(50),
                                  price: rand(1000..10000)} )
  bookingInstance.service = Service.order("random()").first
  bookingInstance.client = Client.order("random()").first
  bookingInstance.save
  end

  # create 50 random reviews and assign to a random booking
  5.times do
  reviewInstance = Review.new( {rating: rand(0..5),
                                description: Faker::Hipster.paragraph} )
  reviewInstance.booking = Booking.order("random()").first
  reviewInstance.save
  end
end

puts 'done'


