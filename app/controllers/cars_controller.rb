class CarsController < ApplicationController
  # This method call the view index
  before_action :authenticate_user!
  before_action :set_car, except: [ :new, :create ]
  def new
    @car = Car.new
  end

  def show
    @booking = Booking.new
    # RF: Added line below for Reviews
    @reviews = @car.reviews.includes(:user)
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

  def edit
  end

  def update
    @car.user = current_user
    if @car.update(set_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @car.destroy
      redirect_to dashboards_path, status: :see_other
    else
      flash[:alert] = "Car could not be deleted"
      redirect_to dashboards_path, status: :unprocessable_entity
    end
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end

  def set_params
    params.require(:car).permit(:make, :model, :colour, :description, :year, :photo)
  end
end
