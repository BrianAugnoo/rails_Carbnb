class CarsController < ApplicationController
  # This method call the view index
  before_action :authenticate_user!
  def index
    # TODO : ryan
  end

  def new
    @car = Car.new
  end

  def show
    @car = Car.find(params[:id])
  end
end
