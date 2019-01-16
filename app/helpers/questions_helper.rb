module QuestionsHelper
  def question_form_header(question)
    action = question.new_record? ? I18n.t('shared.create_new') : I18n.t('shared.edit')
    I18n.t('shared.helpers.question_form_header', action: action, test_title: question.test.title)
  end
end
