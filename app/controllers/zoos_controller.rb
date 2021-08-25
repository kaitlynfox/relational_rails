class ZoosController < ApplicationController

  def index
    @zoos = Zoo.all 
  end
end
