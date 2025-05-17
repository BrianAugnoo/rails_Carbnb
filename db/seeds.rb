 require 'faker'

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

20.times do |i|
  Car.create!(
    make: ["Toyota", "Tesla", "Nissan", "Ford", "BMW"].sample,
    model: "Model#{i + 1}",
    colour: ["Red", "Black", "White", "Blue"].sample,
    year: 2015 + i,
    description: "#{Faker::Vehicle.standard_specs.join(", ")} — lorem ipsum dolor sit amet consectetur adipiscing elit.",
    user: owner
  )
end

puts "Creating bookings..."

<<<<<<< HEAD
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
=======
# cleaning and creating a Car instance
description = "very cool car, lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem"
car = create_instance(Car, "car", { make: "peugeot", model: "serie-rails", colour: "black", year: 2006, description: description, user_id: owner[:id] })
create_instance(Car, "car", { make: "toyota", model: "serie-rails", colour: "black", year: 2006, description: description, user_id: owner[:id] }, false)
create_instance(Car, "car", { make: "tesla", model: "serie-rails", colour: "black", year: 2006, description: description, user_id: owner[:id] }, false)
create_instance(Car, "car", { make: "ferari", model: "serie-rails", colour: "black", year: 2006, description: description, user_id: owner[:id] }, false)
create_instance(Car, "car", { make: "nissan", model: "serie-rails", colour: "black", year: 2006, description: description, user_id: owner[:id] }, false)
# cleaning and creating a Booking instance
start_date = Date.today + 1
end_date = start_date + 3
booking = create_instance(Booking, "booking", { start_date: start_date, end_date: end_date, car_id: car[:id], user_id: renter[:id], status: true })
>>>>>>> 7bb2299e6e96bd02e0f344ba94578cd5152891ee

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
    booking: booking,
    message: "New booking request for your car from #{booking.user.user_name}"
  )
  Notification.create!(
    user: booking.user,
    booking: booking,
    message: booking.status ? "Your booking has been accepted." : "Your booking has been rejected."
  )
end

puts "Seed finished successfully."
