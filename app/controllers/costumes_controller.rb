class CostumesController < ApplicationController
  before_action :set_costume, only: [:show, :update, :destroy]

  def index
    @costumes = Costume.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    if @costume.save
      redirect_to @costume
    else
      render :new
    end
  end

  def destroy
    @costume.destroy
    redirect_to costumes_path
  end
private

  def set_costume
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def costume_params
    params.require(:costume).permit(:name, :user, :category, :description, :price)
  end
end
