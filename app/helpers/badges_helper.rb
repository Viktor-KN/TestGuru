module BadgesHelper
  def badge_form_header(badge)
    action = badge.new_record? ? I18n.t('shared.create_new') : I18n.t('shared.edit')
    I18n.t('shared.helpers.badge_form_header', action: action)
  end
end
