class HomeController < ApplicationController
  def index
    if params.dig(:search, :query).present?
      query = params[:search][:query]
      @cars = Car.where("make ILIKE ?", "%#{query}%")
    else
      @cars = Car.all
    end
  end

  def account
  end
end
