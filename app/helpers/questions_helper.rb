module QuestionsHelper
  def question_form_header(question)
    action = question.new_record? ? 'Create new' : 'Edit'
    "#{action} #{question.test.title} Question"
  end
end
