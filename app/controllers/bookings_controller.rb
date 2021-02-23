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
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new(booking_params)
    @booking.costume = @costume
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "costumes/show"
    end
  end

  # def destroy
  #   @booking.destroy
  #   redirect_to bookings_path
  # end
private

  def set_booking
   @booking = Booking.find(params[:id])
   authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:checkout_date, :return_date)
  end
end
