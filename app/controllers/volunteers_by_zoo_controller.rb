class VolunteersByZooController < ApplicationController

  def index
    @zoo = Zoo.find(params[:id])
    # years = params[:years_of_experience]
    @volunteers = @zoo.volunteers.order(params[:sort]).experienced(params[:years_of_experience])
  end

  def new
    @zoo = Zoo.find(params[:id])
  end

  def create
    zoo = Zoo.find(params[:id])
    volunteer = zoo.volunteers.create(volunteer_params)
    redirect_to "/zoos/#{zoo.id}/volunteers"
  end

  def volunteer_params
    params.permit(:name,
                  :certified_trainer,
                  :years_of_experience)
  end
end
