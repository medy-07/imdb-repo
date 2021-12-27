class CommentsController < ApplicationController
  def create
  	# binding.pry
    @movie = Movie.find(params[:movie_id])
    # binding.pry
    @comment = @movie.comments.create(comment_params)
    redirect_to movie_path(@movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
