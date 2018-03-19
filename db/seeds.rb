# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u = User.create({first_name: 'danny', last_name: 'thetester', avatar: '1223', email: 'azez@gmail.com', password: 'zaijdajzn'})
c = Client.new
c.user = u
c.save

con = Contractor.new
con.user = u
con.save

ser = Service.new
ser.contractor = con
ser.save

o = User.create({first_name: 'dannysecond', last_name: 'thetester', avatar: '1223', email: 'azez@gmail.com', password: 'zaijdajzn'})
book = Booking.new
book.service = ser
book.client = o
book.save
