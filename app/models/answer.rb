class Answer < ApplicationRecord
  MAX_ANSWERS_PER_QUESTION = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers_per_question, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers_per_question
    if question.answers.count >= MAX_ANSWERS_PER_QUESTION
      errors.add(:question_id, "Maximum answers per question reached")
    end
  end
end
