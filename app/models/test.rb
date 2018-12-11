class Test < ApplicationRecord
  belongs_to :category
  has_many :questions

  def self.titles_by_category(cat_title)
    joins(:category).where('categories.title' => cat_title).distinct.order('tests.id DESC').pluck(:title)
  end
end
