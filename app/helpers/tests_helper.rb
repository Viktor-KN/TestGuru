module TestsHelper
  def test_form_header(test)
    action = test.new_record? ? I18n.t('shared.create_new') : I18n.t('shared.edit')
    I18n.t('shared.helpers.test_form_header', action: action)
  end
end
