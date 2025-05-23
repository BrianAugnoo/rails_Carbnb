class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user: current_user).order(created_at: :desc)
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @notification = Notification.new(set_params)
    @notification.user = @booking.user
    @owner = @booking.car.user
    if @notification.save
      if @booking[:status]
        @owner_notification = Notification.new(set_params)
        @owner_notification.user = @owner
        @owner_notification.save
      end
      render json: { status: :ok, message: "Notification created successfully." }
    else
      render json: { status: :unprocessable_entity, message: "Error creating notification.", errors: @notification.errors.full_messages }
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    if @notification.user == current_user
      @notification.destroy
      flash[:notice] = "Notification deleted."
      redirect_to notifications_path
    end
  end

  def mark_as_read
    @notification = Notification.find(params[:id])
    @notification.update(read: true)
    redirect_to notifications_path
  end

  private
  def set_params
    params.require(:notification).permit(:message)
  end
end
