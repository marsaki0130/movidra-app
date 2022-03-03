class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  def show
    movie = Movie.find(params[:movie_id])
  end

  def create
  end

  def destroy
  end
end