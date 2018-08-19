class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test'
  has_and_belongs_to_many :badges

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+@.+\..+/i }

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

  def passed_tests_by_scope(scope)
    tests.send(scope).select do |test|
      test.test_passages.any? { |tp| tp.score >= 80 }
    end.uniq
  end

  def scope_completed?(scope)
    passed_tests_by_scope(:elementary).count == Test.send(scope).count
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a? Admin
  end
end

