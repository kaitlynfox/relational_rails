class RidesByAmusementParkController < ApplicationController

  def index
    @amusement_park = AmusementPark.find(params[:id])
    @rides_by_amusement_park =  AmusementPark.find(params[:id]).rides
  end

  # def show
  #   @amusement_park = AmusementPark.find(params[:id])
  # end
end
