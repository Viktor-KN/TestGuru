class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.titles_by_category(category_title)
    joins(:category).where(categories: { title: category_title }).distinct.order(title: :desc).pluck(:title)
  end
end
