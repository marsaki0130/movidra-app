class MoviesController < ApplicationController
  def index
    @movie = Movie.all
  end

  def show
  end

  def new
    @movie = current_user.movie.build
  end

  def create
    @movie = current_user.movie.build(movie_params)

  end

  private
  def movie_params
    params.require(:movie).permit(:title)
  end
end