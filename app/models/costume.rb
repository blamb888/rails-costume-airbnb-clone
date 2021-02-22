class Costume < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # validates :availability, presence: true
end