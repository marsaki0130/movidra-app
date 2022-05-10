class MoviesController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery :except => [:destroy]
  
  def index
    @movie = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = current_user.movie.build
  end

  def create
    @movie = current_user.movie.build(movie_params)
    if @movie.save
      redirect_to movies_path, notice: '保存できました'
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    movie = current_user.movie.find(params[:id])
    movie.destroy!
    redirect_to movies_path, notice: '削除に成功しました' 
  end

  def search
    @movie = Movie.search(params[:search])
    @keyword = params[:search]
    render "index"
  end


  private
  def movie_params
    params.require(:movie).permit(:title, :eyecatch, :story, :entertainment, :genre).merge(user_id: current_user.id)
  end
end