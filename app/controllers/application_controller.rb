class ApplicationController < ActionController::Base
  before_action :authenticate!

  helper_method :current_user

  private

  def authenticate!
    unless current_user
      flash.now[:alert] = 'ログインが必要です'
      redirect_to new_user_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
