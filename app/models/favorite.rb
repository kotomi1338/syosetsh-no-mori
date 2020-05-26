class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :novel_node

  validates :user_id, uniqueness: { scope: :novel_node_id }
end
