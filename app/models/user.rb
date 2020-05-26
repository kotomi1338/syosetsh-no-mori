class User < ApplicationRecord
  has_secure_password

  has_many :novel_nodes, class_name: 'NovelNode'
  has_many :favorites
  has_many :favorite_novel_nodes, through: :favorites, source: :novel_node

  validates :name, presence: true
  validates :id_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def favorite(novel_node)
    favorites.create(novel_node: novel_node)
  end
end
