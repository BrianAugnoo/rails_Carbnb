class HomeController < ApplicationController
  def index
    @empty_car = Car.new
    @cars = Car.all
    @user = User.new
  end
end
