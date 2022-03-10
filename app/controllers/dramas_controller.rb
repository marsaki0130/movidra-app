class DramasController < ApplicationController
  def index
    @drama = Drama.all
  end

  def show
    @drama = Drama.find(params[:id])
  end

  def new
    @drama = current_user.drama.build
  end

  def create
    @drama = current_user.drama.build(drama_params)
    if @drama.save
      redirect_to root_path, notice: '保存できました'
    else
      flash.now[:eror] = '更新できませんでした'
      render :new
    end
  end

  
  private
  def drama_params
    params.require(:drama).permit(:title, :eyecatch, :story).merge(user_id: current_user.id)
  end
end