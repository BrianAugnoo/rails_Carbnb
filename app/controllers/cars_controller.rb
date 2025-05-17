class CarsController < ApplicationController
  # This method call the view index
  before_action :authenticate_user!
  before_action :set_car, except: [ :new, :create ]
  def new
    @car = Car.new
  end

  def show
    @booking = Booking.new
  end

  def create
    @car = Car.new(set_params)
    @car.user = current_user
    if @car.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end

  def set_params
    params.require(:car).permit(:make, :model, :colour, :description, :year)
  end
end
