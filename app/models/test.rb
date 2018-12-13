class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :results, dependent: :destroy
  has_many :participants, through: :results, source: :user
  has_many :questions, dependent: :destroy

  def self.titles_by_category(category_title)
    joins(:category).where(categories: { title: category_title }).distinct.order(title: :desc).pluck(:title)
  end
end
