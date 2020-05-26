require 'active_model'

class ThemeWord
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :who, :string
  attribute :where, :string
  attribute :what, :string
  attribute :user_id, :integer

  def save
    self.user_id = 1
    word = [
      Who.create(content: self.who, user_id: self.user_id),
      Where.create(content: self.where, user_id: self.user_id),
      What.create(content: self.what, user_id: self.user_id),
    ]
    word.all?
  end
end
