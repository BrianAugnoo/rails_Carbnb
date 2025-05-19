class DashboardsController < ApplicationController
  def index
    @cars = current_user.cars
    @bookings = Booking.all
    @user_bookings = []

    @cars.each do |car|
      car.bookings.each do |booking|
          @user_bookings << booking
      end
    end
  end
end
