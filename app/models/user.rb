class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :completed_tests, through: :results, source: :test
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify
end
