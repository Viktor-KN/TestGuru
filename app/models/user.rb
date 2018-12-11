class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results

  def completed_tests_by_level(level)
    tests.select { |test| test.level == level }
  end
end
