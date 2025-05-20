class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @review = @car.reviews.build
  end

  def create
    @review = @car.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to car_path(@car), notice: "Review created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to car_path(@car), notice: "Review updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to car_path(@car), notice: "Review deleted successfully.", status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_review
    @review = @car.reviews.find(params[:id])
  end

  def authorize_user!
    unless @review.user == current_user
      redirect_to car_path(@car), alert: "You cannot add a review for your own car."
    end
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
