class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(id_name: user_params[:id_name])
    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:alert] = 'ログアウトしました'

    redirect_to new_session_path
  end

  private

  def user_params
    params.require(:user).permit(
      :id_name,
      :password,
    )
  end
end
