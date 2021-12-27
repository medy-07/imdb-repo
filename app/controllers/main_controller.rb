class MainController < ApplicationController
  def index
    # binding.pry
    @movies = Movie.all
    @movies = Movie.search(params[:search])
  end
end