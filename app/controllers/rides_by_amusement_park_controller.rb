class RidesByAmusementParkController < ApplicationController

  def index
    # binding.pry
    @amusement_park = AmusementPark.find(params[:id])
    @rides_by_amusement_park =  @amusement_park.alpha_rides_by_park(params[:alphabetize])

  end

  def new
    @amusement_park = AmusementPark.find(params[:id])
  end

  def create
    @amusement_park = AmusementPark.find(params[:id])
    new_ride = @amusement_park.rides.create(ride_params)
    redirect_to "/amusement_parks/#{@amusement_park.id}/rides"
  end

  def ride_params
    params.permit(:name, :top_speed, :roller_coaster)
  end
end
