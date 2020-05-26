require 'active_model'

class NovelNodeWithTheme
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_reader :novel_node

  attribute :who_id, :integer
  attribute :where_id, :integer
  attribute :what_id, :integer
  attribute :novel_node_content, :string
  attribute :user_id, :integer

  def save
    ActiveRecord::Base.transaction do
      theme = get_theme
      theme.save
      novel_node = get_novel_node
      novel_node.theme = theme
      novel_node.user_id = user_id
      novel_node.save
      @novel_node = novel_node
    end
  end

  def get_theme
    Theme.new(who_id: who_id, where_id: where_id, what_id: what_id)
  end

  def get_novel_node
    NovelNode.new(content: novel_node_content)
  end

  class << self
    def new_random
      instance = self.new
      instance.who_id = get_random_one_id Who
      instance.where_id = get_random_one_id Where
      instance.what_id = get_random_one_id What

      instance
    end

    private

      def get_random_one_id(model)
        if model.count > 0
          model.where( 'id >= ?', rand(model.first.id..model.last.id) ).first.id
        end
      end
  end
end
