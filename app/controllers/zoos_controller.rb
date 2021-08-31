class ZoosController < ApplicationController

  def index
    @zoos = Zoo.ordered
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  def new

  end

  def create
    new_zoo = Zoo.create(name: params[:name],
                         rank: params[:rank],
                         state_funding: params[:state_funding],
                         city: params[:city]
                       )

    redirect_to "/zoos"
  end

  def zoo_params
    params.permit(:name, :rank, :state_funding, :city)
  end

  def edit
    @zoo = Zoo.find(params[:id])
  end

  def update
    zoo = Zoo.find(params[:id])
    zoo.update(zoo_params)
    redirect_to "/zoos/#{zoo.id}"
  end

  def destroy
    zoo = Zoo.find(params[:id])
    zoo.destroy
    redirect_to "/zoos"
  end
end
