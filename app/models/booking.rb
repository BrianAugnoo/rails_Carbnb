class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  has_many :notifications, dependent: :destroy
  validates :start_date, :end_date, presence: true
  validate :valid_start_date
  validate :valid_end_date
  validate :unique_date

  private
  # This method ensures that the date entered by users is current
  def valid_start_date
    if start_date < Date.today
      errors.add(:start_date, "this date has expired")
    end
  end

  # This method ensures that the date entered by users is more than start_date
  def valid_end_date
    if end_date <= start_date
      errors.add(:end_date, "this date is less than the start of the rental")
    end
  end

  # check that the date has not already been taken
  def unique_date
    car = self.car
    car.bookings.each do |booking|
      if invalid_date(start_date, booking) && booking[:id] != self[:id]
        errors.add(:start_date, "this date has already been taken")
      end
      if invalid_date(end_date, booking) && booking[:id] != self[:id]
        errors.add(:end_date, "this date has already been taken")
      end
    end
  end

  # the booking must not start or end during an existing booking
  def invalid_date(date, booking)
    date >= booking[:start_date] && date <= booking[:end_date]
  end
end
