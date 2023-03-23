class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototypes = Prototype.new
  end
end
