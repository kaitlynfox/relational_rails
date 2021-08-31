class AmusementParksController < ApplicationController

  def index
    @amusement_parks = AmusementPark.ordered_parks
  end

  def show
    @amusement_park = AmusementPark.find(params[:id])
  end

  def new
  end
  
  def create
    new_amusement_park = AmusementPark.create(amusement_park_params)
    redirect_to "/amusement_parks"
  end

  def edit
    @amusement_park = AmusementPark.find(params[:id])
  end

  def update
    amusement_park = AmusementPark.find(params[:id])
    amusement_park.update(amusement_park_params)
    redirect_to "/amusement_parks/#{amusement_park.id}"
  end

  def amusement_park_params
    params.permit(:name,:cost_of_entry,:open_year_round)
  end
end
