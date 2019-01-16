module TestPassagesHelper
  def test_progress(test_passage)
    "#{test_passage.current_question_index}/#{test_passage.test.questions.count}"
  end

  def test_result_status(test_passage)
    test_passage.result_success? ? I18n.t('test_passages.result.passed') : I18n.t('test_passages.result.failed')
  end
end
