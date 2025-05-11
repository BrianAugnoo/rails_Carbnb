destroy_message = "destroy all existing "

# cleaning and creating a User instance
puts destroy_message + "users"
User.destroy_all
puts "create user brian"
brian = User.create!(email: "brianaugnoo@gmail.com", password: "baugnoo", password_confirmation: "baugnoo")
puts "the user are created"

# cleaning and creating a Car instance
puts destroy_message + "car"
Car.destroy_all
puts "create Brian cars"
description = "very cool car, lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem"
brian_car = Car.new(make: "peugeot", model: "i dont now", colour: "black", year: 2006, description: description)
brian_car.user = brian
result = brian_car.save ? "the car are saved" : "the car are not saved"
puts result

# cleaning and creating a Booking instance
puts destroy_message + "bookings"
Booking.destroy_all
puts "create booking"
start_date = Date.today + 1
end_date = start_date + 3
puts "#{start_date} #{end_date}"
booking = Booking.new(start_date: start_date, end_date: end_date)
booking.car = brian_car
booking.user = brian
result = booking.save ? "the booking are saved" : "the  booking are not saved"
puts result
