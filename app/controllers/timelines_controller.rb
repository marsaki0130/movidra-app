class TimelinesController < ApplicationController
  def show
    @movies = Movie.find(Comment.group(:movie_id).order('count(movie_id) desc').pluck(:movie_id))
  end
end