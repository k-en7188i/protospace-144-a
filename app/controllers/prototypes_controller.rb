class PrototypesController < ApplicationController
  
  def index
    @prototypes = Prototype.all
  end

  def show
    @prototypes = Prototype.find(params[:id])
  end

end
