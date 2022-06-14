class TimelinesController < ApplicationController
  def show
    @movies = Movie.find(Like.group(:movie_id).order('count(movie_id) desc').pluck(:movie_id))
  end
end