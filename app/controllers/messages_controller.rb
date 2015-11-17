class MessagesController < ApplicationController
	before_action :authenticate

	def index
		@messages = Message.where(from: params[:user_id])
	end

	def show
		@message = Message.find(params[:id])
	end

	def new
		@user = User.find(session[:looked_user])
		@message = Message.new(from: current_user.id,
		                       to: @user.id)
	end

	def create
		@user = User.find(session[:looked_user])
		@message = Message.new(message_params)
		if @message.save
			redirect_to @user, notice: "Posted Message."
		else
			render 'new'
		end
	end

private
	def message_params
    params.require(:message).permit(:from, :to, :body)
  end

end
