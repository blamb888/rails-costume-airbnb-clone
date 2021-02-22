class Booking < ApplicationRecord
  belongs_to :costume
  belongs_to :user

  enum status: [ :pending, :confirmed, :rejected ]
  validates :user, presence: true
  validates :costume, presence: true
  validates :return_date, presence: true
  validates :checkout_date, presence: true
end
