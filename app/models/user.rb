class User < ApplicationRecord
  # before_action :configure_permitted_parameters, if: :devise_controller?
  has_many :costumes
  has_many :bookings
  has_one_attached :photo

  ADDRESSES = ["Tokyo Tower", "Tokyo Skytree", "Tokyo Stadium", "Shibuya Stations", "Shinjuku Station", "Tokyo Station", "Shibuya Miyashita Park"]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :phone_number, presence: true

  #   def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end
end
