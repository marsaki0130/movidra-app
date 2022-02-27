class SpoilersController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @spoiler = @movie.spoilers
  end

  def new
    movie = Movie.find(params[:movie_id])
    @spoiler = movie.spoilers.build
  end

  def create
  end
end