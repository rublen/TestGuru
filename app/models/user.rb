class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.where(id: TestPassage.where(user_id: id).pluck(:test_id), level: level)
  end
end
