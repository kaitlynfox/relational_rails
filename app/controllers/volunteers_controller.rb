class VolunteersController < ApplicationController

  def index
    @volunteers = Volunteer.where(certified_trainer: true)
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    volunteer = Volunteer.find(params[:id])
    volunteer.update(volunteer_params)
    redirect_to "/volunteers/#{volunteer.id}"
  end

  def volunteer_params
    params.permit(:name,
                  :certified_trainer,
                  :years_of_experience)
  end

end
