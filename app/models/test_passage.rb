class TestPassage < ApplicationRecord
  TEST_RESULT_SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_update_set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_index
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def result_success?
    result_percent >= TEST_RESULT_SUCCESS
  end

  def result_percent
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def before_update_set_next_question
    self.current_question = next_question
  end
end
