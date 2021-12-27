class ActorsController < ApplicationController

  def create
    @movie = Movie.find(params[:actor][:movie_id])
    @actor = @movie.actors.create(actor_params)
    redirect_to movie_path(@movie)
  end

  def new
    # @movie = Movie.find(params[:format])
    @actor = Actor.new
  end

  def show
    # @movie = Movie.find(params[:id])
    # @actor = @movie.actors
    @actor = Actor.find(params[:id])
  end

  def index
    @actors = Actor.all
  end

  def destroy
    if user_signed_in?
      @actor = Actor.find(params[:id])
      @actor.destroy
      redirect_to root_path
    else
      redirect_to new_user_registration_path
    end
  end
end

private

  def actor_params
    params.require(:actor).permit(:f_name, :l_name, :gender)
  end
