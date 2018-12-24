module TestPassagesHelper
  TEST_RESULT_SUCCESS = 85

  def test_progress(test_passage)
    "#{test_passage.current_question_index}/#{test_passage.test.questions.count}"
  end

  def test_result_success?(test_passage)
    test_result_percent(test_passage) >= TEST_RESULT_SUCCESS
  end

  def test_result_percent(test_passage)
    (test_passage.correct_questions.to_f / test_passage.test.questions.count * 100).to_i
  end

  def test_result_status(test_passage)
    test_result_success?(test_passage) ? 'PASSED' : 'FAILED'
  end
end
