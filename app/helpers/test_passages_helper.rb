module TestPassagesHelper
  def test_progress(test_passage)
    "#{test_passage.current_question_index}/#{test_passage.test.questions.count}"
  end

  def test_result_status(test_passage)
    test_passage.result_success? ? I18n.t('test_passages.result.passed') : I18n.t('test_passages.result.failed')
  end

  def time_counter(test_passage)
    total_seconds = test_passage.seconds_left

    return '00:00:00' if total_seconds.negative?

    seconds = total_seconds % 60
    minutes = (total_seconds / 60) % 60
    hours = total_seconds / (60 * 60)

    format("%02d:%02d:%02d", hours, minutes, seconds)
  end
end
