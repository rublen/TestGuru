class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.where(level: level, test_passages: { user_id: id })
      .joins("JOIN test_passages ON tests.id = test_id")
  end
end
