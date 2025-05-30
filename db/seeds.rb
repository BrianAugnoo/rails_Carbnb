require 'faker'
require 'open-uri'

puts "Resetting database..."

Notification.destroy_all
Review.destroy_all
Booking.destroy_all
Car.destroy_all
User.destroy_all

puts "Creating users..."

owner = User.create!(
  email: "owner@example.com",
  password: ENV["USER_PASSWORD"],
  password_confirmation: ENV["USER_PASSWORD"],
  user_name: "car_owner"
)

renter = User.create!(
  email: "renter@example.com",
  password: ENV["USER_PASSWORD"],
  password_confirmation: ENV["USER_PASSWORD"],
  user_name: "car_renter"
)

visitor = User.create!(
  email: "visitor@example.com",
  password: ENV["USER_PASSWORD"],
  password_confirmation: ENV["USER_PASSWORD"],
  user_name: "car_viewer"
)

puts "Creating cars..."

car_images = URI.open("https://res.cloudinary.com/dygzxvimx/image/upload/v1748010088/how-to-create-a-car-newblogcover_mkhah3.png")
10.times do |i|
  car = Car.create!(
    make: [ "Toyota", "Tesla", "Nissan", "Ford", "BMW" ].sample,
    model: "Model#{i + 1}",
    colour: [ "Red", "Black", "White", "Blue" ].sample,
    year: 2015 + i,
    description: "#{Faker::Vehicle.standard_specs.join(", ")} — lorem ipsum dolor sit amet consectetur adipiscing elit.",
    user: owner
  )
  car.photo.attach(io: car_images, filename: "car_#{i + 1}.png", content_type: "image/png")
end

puts "Creating bookings..."

Car.all.each_with_index do |car, index|
  next if index.even?
  Booking.create!(
    start_date: Date.today + 3,
    end_date: Date.today + 5,
    car: car,
    user: renter,
    status: [true, false].sample
  )
end

puts "Creating reviews..."

Car.limit(5).each do |car|
  Review.create!(
    rating: rand(3..5),
    comment: "#{Faker::Lorem.sentence(word_count: 10)}",
    user: renter,
    car: car
  )
end

puts "Creating notifications..."

Booking.all.each do |booking|
  Notification.create!(
    user: booking.car.user,
    message: "New booking request for your car from #{booking.user.user_name}"
  )
  Notification.create!(
    user: booking.user,
    message: booking.status ? "Your booking has been accepted." : "Your booking has been rejected."
  )
end

puts "Seed finished successfully."
