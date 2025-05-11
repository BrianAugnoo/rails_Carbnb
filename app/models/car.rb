class Car < ApplicationRecord
  belongs_to :user
  validates :make, :model, :colour, :year, presence: true, allow_blank: false
  validates :description, length: { minimum: 50, message: "the description should have min 50 chars" }
end
