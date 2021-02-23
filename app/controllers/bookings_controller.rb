class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to costume_bookings_path
    else
      render :new
    end
  end

  # def destroy
  #   @booking.destroy
  #   redirect_to bookings_path
  # end
private

  def set_booking
   @booking = Booking.find(params[:id])
   # authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:name, :user, :category, :description, :price)
  end
end
