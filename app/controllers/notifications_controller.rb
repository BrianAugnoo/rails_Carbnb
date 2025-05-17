class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(user: current_user).order(created_at: :desc)
  end
end
