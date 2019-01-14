class User < ApplicationRecord
  EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/.freeze

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :name, presence: true, length: { minimum: 3, maximum: 64 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
