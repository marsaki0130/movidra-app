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
    @movie = Movie.find(params[:movie_id]) 
    @spoiler = @movie.spoilers.build(spoiler_params)
    if @spoiler.save
      redirect_to movie_path(@movie), notice: 'ネタバレを追加しました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def spoiler_params
    params.require(:spoiler).permit(:content) .merge(user_id: current_user.id)
  end
end