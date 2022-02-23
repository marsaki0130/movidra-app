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
    if @movie.save
      redirect_to root_path, notice: '保存できました'
    else
      render :new
    end
  end

  def destroy
    movie = current_user.movie.find(params[:id])
    movie.destroy!
    redirect_to root_path, notice: '削除に成功しました' 
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :eyecatch)
  end
end