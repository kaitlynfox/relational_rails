class RidesController < ApplicationController

  def index
    @rides = Ride.true_rides
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

  def destroy
    Ride.destroy(params[:id])
    redirect_to '/rides'
  end

  def ride_params
    params.permit(:name, :top_speed, :roller_coaster)
  end
end
