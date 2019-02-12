class TestPassage < ApplicationRecord
  TEST_RESULT_SUCCESS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question
  before_update :before_update_set_result, if: :completed?
  before_update :before_update_check_time_limit, if: proc { time_limited? && in_progress? }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def in_progress?
    !completed?
  end

  def time_limited?
    test.time_limit.positive?
  end

  def timed_out?
    result&.negative? || created_at + test.time_limit.minutes < Time.current
  end

  def current_question_index
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def result_success?
    completed? && result >= TEST_RESULT_SUCCESS
  end

  def calc_result_percent
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

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_update_set_result
    self.result = calc_result_percent
  end

  def before_update_check_time_limit
    if timed_out?
      self.current_question = nil
      self.result = -1
    end
  end
end
