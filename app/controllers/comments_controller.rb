class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments
  end


  def new
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.build
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.build(movie_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to movie_path(@movie), notice:'コメントを追加'
    else
      flash.now[:error] = '保存に失敗しました' 
      render :index
    end
  end

  private
  def movie_params
    params.require(:comment).permit(:feelings, :star).merge(user_id: current_user.id)
  end
end