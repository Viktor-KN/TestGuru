class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, :time_limit, numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  scope :by_category_title, ->(category_title) { joins(:category).where(categories: { title: category_title }) }
  scope :by_category_id, ->(category_id) { where(category_id: category_id) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_id, ->(id) { where(id: id) }
  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  def self.titles_by_category_title(category_title)
    by_category_title(category_title).distinct.order(title: :desc).pluck(:title)
  end
end
