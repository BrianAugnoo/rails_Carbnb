def create_instance(model, element_str, key)
  puts "destroy all existing #{element_str}s"
  model.destroy_all
  puts "create " + element_str
  element = model.create!(key)
  puts "the #{element_str} are saved"
  element
end

# cleaning and creating a User instance
user = create_instance(User, "user", { email: "brianaugnoo@gmail.com", password: ENV["USER_PASSWORD"], password_confirmation: ENV["USER_PASSWORD"] })

# cleaning and creating a Car instance
description = "very cool car, lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem"
car = create_instance(Car, "car", { make: "peugeot", model: "serie-rails", colour: "black", year: 2006, description: description, user_id: user[:id] })

# cleaning and creating a Booking instance
start_date = Date.today + 1
end_date = start_date + 3
booking = create_instance(Booking, "booking", { start_date: start_date, end_date: end_date, car_id: car[:id], user_id: user[:id] })

# cleaning and creating a review instance
review = create_instance(Review, "review", { rating: 4, comment: "cool car", car_id: car[:id], user_id: user[:id] })

# cleaning and creating a notification instance
message = "Your car has been booked for #{booking[:start_date]} until #{booking[:end_date]}"
notification = create_instance(Notification, "notification", { message: message, user_id: user[:id], booking_id: booking[:id] })
