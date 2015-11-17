class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user, :logged_in?

  def current_user
  	return unless session[:user_id]
  	@current_user ||= User.find(session[:user_id])
  end

  def logged_in?
  	!!session[:user_id]
  end

	def authenticate
		return if logged_in?
		# store_location
		redirect_to :root, warning: "Please sign in."
	end
end
