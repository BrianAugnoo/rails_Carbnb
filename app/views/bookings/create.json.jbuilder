json.id @booking.id
json.date "#{@booking.start_date}- #{@booking.end_date}"
json.status @booking[:status]
json.message "Booking created successfully"
json.success true
