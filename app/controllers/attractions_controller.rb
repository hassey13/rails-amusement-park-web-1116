class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)

    redirect_to @attraction
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def ride
    @attraction = Attraction.find(params[:id])
    @user = User.find(current_user.id)
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    flash[:notice] = "#{@ride.take_ride}"
    redirect_to current_user
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
