class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  def as_json(options = {})
    super(options.merge(include: [:user, comments: {include: :user}]))
  end
end
