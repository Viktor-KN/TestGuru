class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, source: :test
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
