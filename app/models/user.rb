class User < ApplicationRecord
  def passed_tests_by_level(level)
    list = []
    TestPassage.where(user_id: id).pluck(:test_id).map do |i|
      test = Test.find(i)
      list << test.title if test.level == level
    end
    list
  end
end
