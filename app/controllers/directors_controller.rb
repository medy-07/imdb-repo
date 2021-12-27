class DirectorsController < ApplicationController
  
  def new
    @director = Director.new
  end

  def create
    @movie = Movie.find(params[:director][:movie_id])
    # binding.pry
    @director = @movie.directors.create(director_params)
    redirect_to movie_path(@movie)
  end

  def show
    # @movie = Movie.find(params[:id])
    # @director = @movie.directors
    @director = Director.find(params[:id])
  end

  def index
    @directors = Director.all
  end

  def destroy
    if user_signed_in?
      @director = Director.find(params[:id])
      @director.destroy
      redirect_to root_path
    else
      redirect_to new_user_registration_path
    end
  end

end

private

  def director_params
    params.require(:director).permit(:f_name, :l_name)
  end

