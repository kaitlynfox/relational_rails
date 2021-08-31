class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def edit
    @ride = Ride.find(params[:id])
  end

  def update
    ride = Ride.find(params[:id])
    ride.update(ride_params)
    redirect_to "/rides/#{ride.id}"
  end

  def ride_params
    params.permit(:name, :top_speed, :roller_coaster)
  end
end
