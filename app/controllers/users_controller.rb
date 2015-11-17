class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find_by(id: params[:id])
    session[:looked_user] = @user.id
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the CLanberry!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @users = User.all
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def help
  end

  def favorite
    @title = 'Favorite Videos'
    @video = current_user.videos.build
    @feed_videos = current_user.favorite_videos.paginate(page: params[:page])
    render template: root_path
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :avatar, :description)
    end

    def signed_in_user
      unless signed_in?
        store_location
        flash[:warning] = "Please sign in."
        redirect_to signin_url
      end
    end

    def correct_user
      @user = User.find_by(id: params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
