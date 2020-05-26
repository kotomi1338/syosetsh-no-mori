class ThemeWordsController < ApplicationController
  def new
    @theme_word = ThemeWord.new
  end

  def create
    @theme_word = ThemeWord.new(theme_params)
    if @theme_word.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def theme_params
    params.require(:theme_word).permit(:who, :where, :what, :user_id)
  end
end
