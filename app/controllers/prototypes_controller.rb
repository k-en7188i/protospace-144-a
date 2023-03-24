class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototypes = Prototype.new
  end

  def create
    prototype = Prototype.new(prototype_params)
    if prototype.save
      redirect_to action: :index
    else
      @prototypes = prototype
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
