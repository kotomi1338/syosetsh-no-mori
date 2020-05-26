require 'will_paginate/array'

class UsersController < ApplicationController
  skip_before_action :authenticate!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def edit_password
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @novel_nodes = @user.novel_nodes.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def favorite_novels
    @user = User.find_by(id: params[:id])
    @novel_nodes = @user.favorites.order(created_at: :desc).map(&:novel_node).paginate(page: params[:page], per_page: 5)
  end

  private

  def user_params
    params.require(:user).permit(:id_name, :name, :email, :bio, :password, :password_confirmation)
  end
end
