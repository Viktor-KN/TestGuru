class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results, dependent: :destroy
  has_many :participants, through: :results, source: :user
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 3..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, ->(category_title) { joins(:category).where(categories: { title: category_title }) }
  scope :titles_by_category, ->(category_title) { by_category(category_title).distinct.order(title: :desc).pluck(:title) }
  scope :by_level, ->(level) { where(level: level) }
end
