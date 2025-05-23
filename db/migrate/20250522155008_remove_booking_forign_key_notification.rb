# This migration removes the foreign key reference to the bookings table from the notifications table.
class RemoveBookingForignKeyNotification < ActiveRecord::Migration[8.0]
  def change
    remove_reference :notifications, :booking, foreign_key: true
  end
end
