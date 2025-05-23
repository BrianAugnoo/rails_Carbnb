class Review < ApplicationRecord
  belongs_to :car
  belongs_to :user
  #validates :rating, presence: true -RF: line of code modified as per below
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
end
