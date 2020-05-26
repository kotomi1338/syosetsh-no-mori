class Theme < ApplicationRecord
  belongs_to :who
  belongs_to :where
  belongs_to :what
  has_many :novel_nodes

  def to_s
    "#{ who&.content }が#{ where&.content }で#{ what&.content }。"
  end
end
