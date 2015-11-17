class FavoritesController < ApplicationController

  def create
    @video = Video.find(params[:video_id])
    current_user.favorite!(@video)
  end

  def destroy
    @video = Favorite.find(params[:id]).video
    current_user.unfavorite!(@video)
  end
end