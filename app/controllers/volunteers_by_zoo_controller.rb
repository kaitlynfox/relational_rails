class VolunteersByZooController < ApplicationController

  def index
    @zoo = Zoo.find(params[:id])
  end
end
