class MoviesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @movies = Movie.all
  end

  def show
    if user_signed_in?
      @movie = Movie.find(params[:id])
    else
      redirect_to new_user_registration_path
    end
  end

  def new
    if user_signed_in?
      @movie = Movie.new
    else
      redirect_to new_user_registration_path
    end
  end
  
  def create
    # binding.pry
    @movie = Movie.new(movie_params)

    if @movie.save
      actor = Actor.find params[:movie][:actor_id]
      @movie.actors << actor
      director = Director.find params[:movie][:director_id]
      @movie.directors << director
      redirect_to @movie, notice: "Movie was successfully Created!!! "
    else
      render :new
    end
  end

  def edit
    # binding.pry
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update(movie_params)
      actor = Actor.find params[:movie][:actor_id]
      @movie.actors << actor unless @movie.actor_ids.include?(actor.id)
      director = Director.find params[:movie][:director_id]
      @movie.directors << director unless @movie.director_ids.include?(director.id)
      redirect_to @movie, notice: "Movie was successfully Edited!!! "
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to root_path, alert: "Movie was successfully Deleted!!! "
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :release_date, :budget, :attachment)
  end

  def actor_params
    params.require(:actor).permit(:f_name,:l_name,:actor_gender)
  end

  def director_params
    params.require(:actor).permit(:f_name,:l_name)
  end
end