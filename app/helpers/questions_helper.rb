module QuestionsHelper
  def question_form_header(test, question)
    if question.new_record?
      action = 'Create new'
      title = test.title
    else
      action = 'Edit'
      title = question.test.title
    end

    "#{action} #{title} Question"
  end
end
