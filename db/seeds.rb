# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'abc@abc.com', name: 'wdi', password: '123456', block: 123, unit: '12-34')
User.create(email: '123@123.com', name: 'wdi-sg', password: '123456', block: 345, unit: '34-56')
User.create(email: 'test@test.com', name: 'wdi-8', password: '123456', block: 123, unit: '56-78')

FacilityType.create(name: 'BBQ', quota: 1, capacity: 4, session_length: 6)
FacilityType.create(name: 'Tennis', quota: 2, capacity: 2, session_length: 2)
FacilityType.create(name: 'Function Room', quota: 1, capacity: 1, session_length: 6)

4.times do |n|
  Facility.create(facility_type_id: 1, number: n+1)
end
2.times do |n|
  Facility.create(facility_type_id: 2, number: n+1)
end
Facility.create(facility_type_id: 3, number: 1)
#
# d = DateTime.new(2017,3,10,4,0,0)
Booking.create(facility_id: 1, user_id: 1, date: "2017-04-18",  start_time: "20:00:00")

Booking.create(facility_id: 1, user_id: 2, date: Date.new(2017, 3, 11),  start_time: "19:00:00")

Booking.create(facility_id: 1, user_id: 3, date: Date.new(2017, 3, 13),  start_time: "16:00:00")

Booking.create(facility_id: 2, user_id: 1, date: Date.new(2017, 3, 11),  start_time: "07:00:00")

Booking.create(facility_id: 3, user_id: 3, date: Date.new(2017, 3, 12),  start_time: "16:00:00")
