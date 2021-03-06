class LikesController < ApplicationController
  before_action :authenticate_user!
  def show
    movie = Movie.find(params[:movie_id])
    like_status = current_user.has_liked?(movie)
    render json: { hasLiked: like_status }  
  end

  def create
    movie = Movie.find(params[:movie_id])
    movie.likes.create!(user_id: current_user.id)

    render json: { status: 'ok'}
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    like = movie.likes.find_by!(user_id: current_user.id)
    like.destroy!
    
    render json: { status: 'ok'}
  end
end