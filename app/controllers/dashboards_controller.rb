class DashboardsController < ApplicationController
  def index
    @cars = current_user.cars
    @bookings = Booking.all
    @my_bookings = current_user.bookings
    @user_bookings = []

    @cars.each do |car|
      car.bookings.each do |booking|
          @user_bookings << booking if booking[:status] == false
      end
    end
  end
end
