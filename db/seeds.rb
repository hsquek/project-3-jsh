# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'hsquek06@gmail.com', name: 'wdi', password: '123456', block: 123, unit: '12-34')
User.create(email: 'skeerti2@gmail.com', name: 'wdi-sg', password: '123456', block: 345, unit: '34-56')
User.create(email: 'johnacsyen@gmail.com', name: 'wdi-8', password: '123456', block: 123, unit: '56-78')

FacilityType.create(name: 'BBQ', quota: 1, capacity: 4, session_length: 6, opens_at: "16:00:00", closes_at: "22:00:00")
FacilityType.create(name: 'Tennis', quota: 2, capacity: 2, session_length: 2, opens_at: "08:00:00", closes_at: "22:00:00")
FacilityType.create(name: 'Function Room', quota: 1, capacity: 1, session_length: 6, opens_at: "16:00:00", closes_at: "22:00:00")
FacilityType.create(name: 'Home')
#
4.times do |n|
  Facility.create(facility_type_id: 1, number: n+1)
end
2.times do |n|
  Facility.create(facility_type_id: 2, number: n+1)
end
Facility.create(facility_type_id: 3, number: 1)
#
# d = DateTime.new(2017,3,10,4,0,0)
Booking.create(facility_type_id: 1, facility_id: 1, user_id: 1, booking_date: "2017-03-14",  start_at: "16:00:00", qr_code: "1234")

Booking.create(facility_type_id: 1, facility_id: 1, user_id: 2, booking_date: "2017-03-15",  start_at: "16:00:00", qr_code: "1234")

Booking.create(facility_type_id: 1, facility_id: 1, user_id: 2, booking_date: "2017-03-16",  start_at: "16:00:00", qr_code: "1234")

Booking.create(facility_type_id: 2, facility_id: 2, user_id: 3, booking_date: "2017-03-15",  start_at: "07:00:00", qr_code: "1234")

Booking.create(facility_type_id: 1, facility_id: 3, user_id: 3, booking_date: "2017-03-14",  start_at: "16:00:00", qr_code: "1234")

Booking.create(facility_type_id: 3, facility_id: 1, user_id: 1, booking_date: "2017-03-18",  start_at: "21:00:00", qr_code: "1234")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')