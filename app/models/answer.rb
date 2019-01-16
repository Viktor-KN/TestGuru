class Answer < ApplicationRecord
  MAX_ANSWERS_PER_QUESTION = 4

  belongs_to :question

  validate :validate_max_answers_per_question, on: :create
  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers_per_question
    if question.answers.count >= MAX_ANSWERS_PER_QUESTION
      errors.add(:base, I18n.t('shared.errors.max_answers_error', count: MAX_ANSWERS_PER_QUESTION))
    end
  end
end
