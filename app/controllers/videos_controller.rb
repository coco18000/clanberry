class VideosController < ApplicationController
	before_action :authenticate, only: [:show]
	before_action :set_video, only: [:show, :edit, :update, :destroy]

	def index
		if params[:tag] != nil
			@videos = Video.tagged_with(params[:tag])
		else
			@videos = Video.all
		end
	end

	def search
	end

	def show
		@user_id = current_user.id
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
		# ログイン周りがバグってるのでコメントアウト
		@video.user_id = current_user.id
		# @video.user_id = 0
		if @video.save
			redirect_to @video, notice: '投稿が完了しました。'
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def tags
		@videos = User.where(tag: params[:tag]).order('count DESC')
	end

	private

	def set_video
		@video = Video.find(params[:id])
	end

	def video_params
		params.require(:video).permit(:code, :title, :videofile, :description, :tag_list)
	end
end
