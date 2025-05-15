def create_instance(model, element_str, key, destroy = true)
  puts "destroy all existing #{element_str}s" if destroy
  model.destroy_all if destroy
  puts "create " + element_str
  element = model.create!(key)
  puts "the #{element_str} are saved"
  element
end

# cleaning and creating a User instance
owner = create_instance(User, "user", { email: "owner@gmail.com", password: ENV["USER_PASSWORD"], password_confirmation: ENV["USER_PASSWORD"], user_name: "owner" })
puts "owner created"
renter = create_instance(User, "user", { email: "renter@gmail.com", password: ENV["USER_PASSWORD"], password_confirmation: ENV["USER_PASSWORD"], user_name: "renter" }, false)
puts "renter created"

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

# cleaning and creating a review instance
review = create_instance(Review, "review", { rating: 4, comment: "cool car", car_id: car[:id], user_id: renter[:id] })

# cleaning and creating a notification instance
message = "Your car has been booked for #{booking[:start_date]} until #{booking[:end_date]} by #{booking.user[:user_name]}"
notification = create_instance(Notification, "notification", { message: message, user_id: owner[:id], booking_id: booking[:id] })
