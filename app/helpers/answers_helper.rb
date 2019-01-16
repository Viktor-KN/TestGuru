module AnswersHelper
  def answer_form_header(answer)
    action = answer.new_record? ? I18n.t('shared.create_new') : I18n.t('shared.edit')
    I18n.t('shared.helpers.answer_form_header', action: action, question_body: answer.question.body)
  end
end
