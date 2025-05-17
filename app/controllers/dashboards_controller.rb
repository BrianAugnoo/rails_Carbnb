class DashboardsController < ApplicationController
  def index
    @cars = current_user.cars
    @bookings = Booking.all
    @user_bookings = []

    @bookings.each do |booking|
      user_booking = false
      @cars.each do |user_car|
        user_booking = true if booking.car = user_car
      end
      @user_bookings << booking
    end
  end
end
