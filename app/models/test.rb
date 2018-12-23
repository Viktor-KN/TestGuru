class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :by_category, ->(category_title) { joins(:category).where(categories: { title: category_title }) }
  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  def self.titles_by_category(category_title)
    by_category(category_title).distinct.order(title: :desc).pluck(:title)
  end
end
