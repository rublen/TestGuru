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

  # complexities: %i[elementary intermediate advanced]
  def passed_tests_by_complexity(complexity)
    tests.send(complexity).select { |t| t.test_passages.positive_pass }
  end

  def complexity_tests_completed?(complexity)
    passed_tests_by_complexity(complexity).uniq.count == Test.send(complexity).count
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a? Admin
  end
end

