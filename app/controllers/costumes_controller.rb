class CostumesController < ApplicationController
  before_action :set_costume, only: [:show, :update, :destroy]
  # visitors can see index page, otherwise will ask for login
  skip_before_action :authenticate_user!, only: [ :index ]


  def index
    @costumes = policy_scope(Costume)
    @markers = User.all.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('icon-png.png')
      }
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @costume = Costume.new
    @categories = ["heroes", "movies", "horror", "animals", "anime", "TV show"]

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
