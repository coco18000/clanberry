class SessionsController < ApplicationController
  def new
  end

  def create
    logger.debug(params)
    user = User.find_by(email: params[:session][:email].downcase)
    logger.debug(params[:session][:password])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
      session[:user_id] = user.id
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    session.delete :user_id
    redirect_to signin_url
  end
end
