class NovelNode < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  belongs_to :parent, class_name: 'NovelNode', optional: true, foreign_key: :parent_id
  has_many :children, class_name: 'NovelNode', foreign_key: :parent_id
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user

  validates :content, presence: true
  validates_inclusion_of :gen, in: 1..4, message: 'この小説は完結しています'

  alias_method :old_save, :save

  def set_gen
    self.gen = parent&.gen.to_i + 1
  end

  def brothers
    NovelNode.where(parent_id: parent.id)
  end

  def ancestors
    return @ancestors if defined? @ancestors
    @ancestors = []
    current_node = self.parent
    loop do
      break if current_node.nil?
      @ancestors << current_node
      current_node = current_node.parent
    end

    @ancestors.reverse!
  end

  def favorited_by?(user)
    Favorite.where(user: user, novel_node: self).exists?
  end

  def save
    set_gen
    old_save
  end
end
