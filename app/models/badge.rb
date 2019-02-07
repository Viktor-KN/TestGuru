class Badge < ApplicationRecord
  CHECK_TYPES = %w[category_completed max_tries_count level_completed].freeze

  has_many :earned_badges, dependent: :destroy
  has_many :users, through: :earned_badges

  validates :name, :description, :image_url, :check_type, presence: true
  validate :validate_param
  validates :check_type, uniqueness: { scope: :param }

  private

  def validate_param
    return if check_type.empty?

    errors.add(:base, I18n.t('shared.errors.param_must_present', name: I18n.t("badges.check_types.labels.#{check_type}"))) if param.empty?
  end
end
