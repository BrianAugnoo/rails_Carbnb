class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :make, :model, :colour, :year, presence: true, allow_blank: false
  validates :description, length: { minimum: 50, message: "the description should have min 50 chars" }
end
