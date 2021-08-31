class VolunteersByZooController < ApplicationController

  def index
    @zoo = Zoo.find(params[:id])

    # volunteers must be associated with this specific zoo
    # THEN we order those volunteers
    @volunteers = @zoo.volunteers.order(params[:sort])
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
