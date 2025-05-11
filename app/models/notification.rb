class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :message, presence: true
end
