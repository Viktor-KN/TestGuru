module QuestionsHelper
  QUESTION_ACTIONS = { new: 'Create new', edit: 'Edit' }.freeze

  def form_header(action, test)
    "#{QUESTION_ACTIONS[action]} #{test.title} Question"
  end
end
