class ZoosController < ApplicationController

  def index
    @zoos = Zoo.order(created_at: :desc)
  end

  def show
    @zoo = Zoo.find(params[:id])
  end
end
