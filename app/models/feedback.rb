class Feedback
  include ActiveModel::Model

  attr_accessor :title, :body

  validates :title, :body, presence: true
  validates :title, length: 3..64
  validates :body, length: 3..10_000

  def id
    0
  end
end
