class CommentsController < ApplicationController

  def show
  end

  def index
  end

  def new
  end

  def create
    @video = Video.find_by(id: params[:video_id])
    @comment = @video.comments.create(
      user_id: params[:user_id],
      video_id: params[:video_id],
      description: params[:comment][:description]
    )
    logger.debug("oooooooo")
    logger.debug(params[:user_id])
    logger.debug(params[:video_id])
    logger.debug(params[:comment][:description])
    redirect_to video_path(@video)
  end


  private

    def comment_params
      params.permit(:user_id, :video_id)
      params.require(:comment).permit(:description)
    end
end
