class CostumesController < ApplicationController
  before_action :set_costume, only: [:show, :update, :destroy]

  def index
    
    if params[:query].blank?
      @costumes = policy_scope(Costume).where(category: params[:category])
    else
      @costumes = policy_scope(Costume).search_by_name_and_category(params[:query])
    end
      
    @markers = User.all.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('ghost.png')
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @costume = Costume.new
    authorize @costume
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    authorize @costume
    if @costume.save
      redirect_to costumes_path
    else
      render :new
    end
  end

  def destroy
    @costume.destroy
    authorize @costume
    redirect_to costumes_path
  end
private

  def set_costume
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def costume_params
    params.require(:costume).permit(:name, :user, :category, :description, :price, :photo)
  end
end
