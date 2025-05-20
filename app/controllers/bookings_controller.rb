class BookingsController < ApplicationController
  before_action :set_params, only: [ :create ]
  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(set_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save && @car.user != current_user
      redirect_to car_path(@booking.car), notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @car = Car.find(@booking.car_id)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: false)
    if @booking.update(set_params)
      redirect_to dashboards_path, notice: "Booking was successfully updated."
    else
      redirect_to dashboards_path, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to dashboards_path, notice: "Booking was successfully deleted."
    else
      redirect_to dashboards_path, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    if @booking.update(status: true)
      redirect_to dashboards_path, notice: "Booking was successfully accepted."
    else
      redirect_to dashboards_path, status: :unprocessable_entity
    end
  end

  private
  def set_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
