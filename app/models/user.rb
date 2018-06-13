class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.where(level: level)
      .joins("JOIN test_passages ON tests.id = test_id")
      .where(test_passages: { user_id: id })
  end
end
