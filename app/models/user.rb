class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages do
    def successful
      where('test_passages.result >= ?', TestPassage::TEST_RESULT_SUCCESS)
    end
  end

  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify
  has_many :gists, dependent: :destroy
  has_many :earned_badges, dependent: :destroy
  has_many :badges, through: :earned_badges

  validates :first_name, :last_name, presence: true, length: 3..64

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
