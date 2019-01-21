module TestsHelper
  def test_form_header(test)
    action = test.new_record? ? I18n.t('shared.create_new') : I18n.t('shared.edit')
    I18n.t('shared.helpers.test_form_header', action: action)
  end

  def test_level(test)
    translation_path = case test.level
                       when 0..1
                         'tests.test.level_easy'
                       when 2..4
                         'tests.test.level_advanced'
                       when 5..Float::INFINITY
                         'tests.test.level_hard'
                       end
    I18n.t(translation_path)
  end
end
