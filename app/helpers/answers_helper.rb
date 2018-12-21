module AnswersHelper
  def answer_form_header(answer)
    action = answer.new_record? ? 'Create new' : 'Edit'
    "#{action} answer for question: #{answer.question.body}"
  end
end
