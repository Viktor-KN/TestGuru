module TestsHelper
  def test_form_header(test)
    action = test.new_record? ? I18n.t('shared.create_new') : I18n.t('shared.edit')
    I18n.t('shared.helpers.test_form_header', action: action)
  end

  def test_level(test)
    case test.level
    when 0..1
      I18n.t('tests.test.level_easy')
    when 2..4
      I18n.t('tests.test.level_advanced')
    when 5..Float::INFINITY
      I18n.t('tests.test.level_hard')
    end
  end
end
