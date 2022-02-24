class CommentsController < ApplicationController
  def new
    movie = Movie.find(params[:movie_id])
    @comment = movie.comments.build
  end

  def create
  end
end