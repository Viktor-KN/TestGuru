class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :name, presence: true, length: { minimum: 3, maximum: 64 }
  validates :email, presence: true, uniqueness: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
