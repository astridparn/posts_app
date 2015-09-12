class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true

  def as_json(options = {})
    super(options.merge(include: {user: { only: [:email] }} ))
  end
end
