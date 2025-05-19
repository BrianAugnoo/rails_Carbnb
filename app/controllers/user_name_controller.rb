class UserNameController < ApplicationController
  def new
  end

  def create
    @user = current_user
    if @user.update(user_name: params[:user_name])
      redirect_to root_path, notice: "Name updated successfully."
    else
      raise
      render :new, alert: "Error updating name."
    end
  end
end
