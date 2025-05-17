class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user: current_user).order(created_at: :desc)
  end

    def destroy
    #@notification = Notification.find(params[:id])
    if @notification.user == current_user
      @notification.destroy
      flash[:notice] = "Notification deleted."
    else
      flash[:alert] = "You are not authorized to delete this notification."
    end
    redirect_to notifications_path
  end

end
