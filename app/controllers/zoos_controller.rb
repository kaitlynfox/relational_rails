class ZoosController < ApplicationController

  def index
    @zoos = Zoo.order(created_at: :desc)
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
end
