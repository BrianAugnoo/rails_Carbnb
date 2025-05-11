puts "destroy all the users"
User.destroy_all
puts "create user brian"
brian = User.create!(email: "brianaugnoo@gmail.com", password: "baugnoo", password_confirmation: "baugnoo")
puts "the user are created"

puts "destroy all car"
Car.destroy_all
puts "create Brian car"
description = "very cool car, lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem lorem"
brian_car = Car.new(make: "peugeot", model: "i don't now", colour: "black", year: 2006, description: description)
brian_car.user = brian
result = brian_car.save ? "the car are saved" : "the car are not saved"
puts result
