# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"

file1 = URI.open('https://img.jamesedition.com/listing_images/2020/05/29/15/05/07/4e71d838-a929-459d-9e13-30c41eec0acc/je/2000xxs.jpg')
file2 = URI.open('https://img.jamesedition.com/listing_images/2020/05/29/15/05/09/43865adb-0051-41fd-b533-a6bdb3ca6d9f/je/2000xxs.jpg')
file3 = URI.open('https://api.deltaprivatejets.com/AircraftImages/N18650/6fbc5f5f-f9ac-42c8-8a9c-d807f966f7a1_large.jpg')

file4 = URI.open('https://img.jamesedition.com/listing_images/2018/05/18/20/17/10/7ced8d3d-b01c-4e37-8225-cf16117189ce/je/2000xxs.jpg')
file5 = URI.open('https://img.jamesedition.com/listing_images/2018/05/18/20/17/12/3527f3af-54cc-42af-a88d-0131be41ddb0/je/2000xxs.jpg')
file6 = URI.open('https://img.jamesedition.com/listing_images/2018/05/18/20/17/11/18f06fb6-a75f-488e-ad92-a5e6ed0bed4c/je/2000xxs.jpg')

file7 = URI.open('https://img.jamesedition.com/listing_images/2020/06/10/11/27/38/bd541be8-ae3b-447f-ba28-38f5c602cfd9/je/2000xxs.jpg')
file8 = URI.open('https://img.jamesedition.com/listing_images/2020/06/10/11/27/40/a84a70e9-d5b9-4180-861b-cafafdc1459d/je/2000xxs.jpg')
file9 = URI.open('https://img.jamesedition.com/listing_images/2020/06/10/11/27/40/2f788b0c-3849-43c9-9032-87f0cc3db784/je/2000xxs.jpg')

file10 = URI.open('https://img.jamesedition.com/listing_images/2020/09/16/15/38/19/dc8d5df5-63db-45fc-b897-9ad827957801/je/2000xxs.jpg')
file11 = URI.open('https://img.jamesedition.com/listing_images/2020/09/16/15/38/19/61a1afba-f90a-4cd3-bc10-fd5cf4a6e380/je/2000xxs.jpg')
file12 = URI.open('https://img.jamesedition.com/listing_images/2020/09/16/15/38/19/44657fc9-56e2-4388-b16c-e8e00ffc0e65/je/2000xxs.jpg')

file13 = URI.open('https://api.deltaprivatejets.com/AircraftImages/N613R/6eea9abb-2379-4a9f-b3dc-bb4e6325bd17_large.jpg')
file14 = URI.open('https://img.jamesedition.com/listing_images/2019/10/01/10/04/24/b4df46d4-8e31-4b6b-af69-64fb919c0a6d/je/2000xxs.jpg')
file15 = URI.open('https://img.jamesedition.com/listing_images/2019/10/01/10/04/24/33e521df-82d9-4ae1-baf0-425a106ee7ba/je/2000xxs.jpg')



Airplane.destroy_all
User.destroy_all
Rating.destroy_all
Booking.destroy_all
puts "db is clean now"
location = [
  "Mexico City International Airport",
  "Cairo Interantional Airport",
  "Madrid-Barajas Adolfo Suárez Airport",
  "John F. Kennedy International Airport ",
  "Los Angeles International Airport",
  "Amsterdam Airport Schiphol",
  "London Heathrow Airport",
  "Oaxaca International Airport"
]
User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, passport_number: Faker::Code.asin, email: "lewagon_mex@lewagon.com", role: "renter",password: "123456")
owner = User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, passport_number: Faker::Code.asin, email: "lewagon@lewagon.com", role: "owner",password: "123456")

5.times do
  Airplane.create!(capacity:rand(1..20),model:Faker::Vehicle.model, price:rand(900.0..10000.0).round(2),booked:false, owner: owner, rating:rand(2..5), address: location.sample)
end


Airplane.first.photos.attach(io: file1, filename: 'plane1.jpg', content_type: 'image/jpg')
Airplane.first.photos.attach(io: file2, filename: 'plane2.jpg', content_type: 'image/jpg')
Airplane.first.photos.attach(io: file3, filename: 'plane3.jpg', content_type: 'image/jpg')
Airplane.first.update!(description:"The Astra SPX was developed by Israel Aircraft Industries in the mid 1990's. The aircraft design was purchased by Gulfstream and renamed the G-100 in the early 2000's.")
Airplane.first.update!(model:"Astra SPX SN 123")

Airplane.second.photos.attach(io: file4, filename: 'plane1.jpg', content_type: 'image/jpg')
Airplane.second.photos.attach(io: file5, filename: 'plane2.jpg', content_type: 'image/jpg')
Airplane.second.photos.attach(io: file6, filename: 'plane3.jpg', content_type: 'image/jpg')
Airplane.second.update!(description:"14 PASSENGER EXECUTIVE CONFIGURATION CONSISTING OF A FORWARD 4-PLACE CLUB, MID CABIN 4-PLACE DIVAN OPPOSITE 2 CLUB CHAIRS AND AFT 4-PLACE CONFERENCE GROUP OPPOSITE A LARGE DIVAN.")
Airplane.second.update!(model:"GULFSTREAM V ")

Airplane.third.photos.attach(io: file7, filename: 'plane1.jpg', content_type: 'image/jpg')
Airplane.third.photos.attach(io: file8, filename: 'plane2.jpg', content_type: 'image/jpg')
Airplane.third.photos.attach(io: file9, filename: 'plane3.jpg', content_type: 'image/jpg')
Airplane.third.update!(description:"This particular Aircraft has only 350 hours since new and features original factory warranty along with additional program coverage through Rolls Royce Corporate Care")
Airplane.third.update!(model:"2008 Hawker 4000 RC-10")

Airplane.fourth.photos.attach(io: file10, filename: 'plane1.jpg', content_type: 'image/jpg')
Airplane.fourth.photos.attach(io: file11, filename: 'plane2.jpg', content_type: 'image/jpg')
Airplane.fourth.photos.attach(io: file12, filename: 'plane3.jpg', content_type: 'image/jpg')
Airplane.fourth.update!(description:"The Falcon 2000 business jet offers executive travelers the spaciousness of a heavy jet with the nimbleness and fuel usage of a much smaller aircraft.")
Airplane.fourth.update!(model:"Falcon 2000 SN 83")

Airplane.fifth.photos.attach(io: file13, filename: 'plane1.jpg', content_type: 'image/jpg')
Airplane.fifth.photos.attach(io: file14, filename: 'plane2.jpg', content_type: 'image/jpg')
Airplane.fifth.photos.attach(io: file15, filename: 'plane3.jpg', content_type: 'image/jpg')
Airplane.fifth.update!(description:"Gulfstream aircraft are world-renowned for sophistication, comfort, and safety. Luxurious seating for up to 13 passengers, and a low cabin altitude of just 6,000 feet deliver you to your destination feeling refreshed.")
Airplane.fifth.update!(model:"Gulfstream IV SP", capacity:13)


puts "db is now seeded"
