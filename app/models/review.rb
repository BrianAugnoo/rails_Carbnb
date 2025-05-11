class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :rating, presence: true
end
