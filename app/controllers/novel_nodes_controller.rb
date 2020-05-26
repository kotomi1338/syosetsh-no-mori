class NovelNodesController < ApplicationController
  def index
    @novel_nodes = NovelNode.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def completed
    @novel_nodes = NovelNode.where(gen: 4).order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @novel_node_with_theme = NovelNodeWithTheme.new_random
    @theme = @novel_node_with_theme.get_theme
  end

  def create
    @novel_node_with_theme = NovelNodeWithTheme.new(novel_node_with_theme_params)
    @novel_node_with_theme.user_id = current_user.id

    if @novel_node_with_theme.save
      redirect_to @novel_node_with_theme.novel_node
    else
      render action: 'new'
    end
  end

  def sequel_new
    parent_node = NovelNode.find_by(id: params[:id])
    @novel_node = NovelNode.new(parent: parent_node)
  end

  def sequel_create
    parent_node = NovelNode.find_by(id: params[:id])

    @novel_node = NovelNode.new(novel_node_params)
    @novel_node.parent = parent_node
    @novel_node.theme = parent_node.theme
    @novel_node.user = current_user

    if @novel_node.save
      redirect_to @novel_node
    else
      render 'sequel_new'
    end
  end

  def favorite
    novel_node = NovelNode.find_by(id: params[:id])
    favorite = Favorite.find_by(user: current_user, novel_node_id: novel_node)

    if favorite
      favorite.destroy
      render :json => {"result": "canceled"}
    else
      current_user.favorite novel_node
      render :json => {"result": "liked"}
    end
  end

  def show
    @novel_node = NovelNode.find_by(id: params[:id])
  end

  private

  def novel_node_params
    params.require(:novel_node).permit(:content)
  end

  def novel_node_with_theme_params
      params.require(:novel_node_with_theme).permit(:novel_node_content, :who_id, :where_id, :what_id)
    end
end
