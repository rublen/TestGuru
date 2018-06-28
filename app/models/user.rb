class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authored_tests, class_name: 'Test'

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
