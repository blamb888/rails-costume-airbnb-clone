class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # validates :availability, presence: true
end
