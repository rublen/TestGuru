class User < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages

  def passed_tests_by_level(level)
    Test.where(level: level, test_passages: { user_id: id })
      .joins("JOIN test_passages ON tests.id = test_id")
  end
end

class Author < User
  has_many :tests

  def initialize(type = :aitor)
    @type = type
  end
end
