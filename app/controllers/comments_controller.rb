class CommentsController < ApplicationController

  def index
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments
  end


  def new
    movie = Movie.find(params[:movie_id])
    @comment = movie.comments.build
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.build(movie_params)
    if @comment.save
      redirect_to movie_path(@movie), notice:'コメントを追加'
    else
      flash.now[:error] = '保存に失敗しました' 
      render :new
    end
  end

  def movie_params
    params.require(:comment).permit(:feelings) 
  end
end