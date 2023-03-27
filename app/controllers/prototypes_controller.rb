class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_prototype, only: [:edit, :show]

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
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if user_signed_in?
      prototype.destroy
      redirect_to action: :index
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    if current_user.id != @prototype.user_id
      redirect_to root_path
    elsif user_signed_in?
      render :edit
    else
      redirect_to new_user_session_path
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    redirect_to prototype_path(prototype.id)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
