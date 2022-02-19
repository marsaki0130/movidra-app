class ProfilesController < ApplicationController
  

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
        redirect_to root_path, notice: 'プロフィールを作成できました'
    else
        flash.now[:eoor] = '更新に失敗しました'
        render :new
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:username)
  end
end