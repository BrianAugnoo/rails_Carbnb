# namespace :rake do
desc "clean up booking"
task update_booking: :environment do
  Booking.all.each do |booking|
    if booking[:end_date] < Date.today
      Booking.destroy(booking[:id])
    end
  end
  puts "booking are uptade"
end
# end
