class HomeController < ApplicationController
  def index
    @users = User.all
    @bookings = Booking.all
  end
end
