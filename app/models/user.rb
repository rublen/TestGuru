class User < ApplicationRecord
  def passed_tests_by_level(level)
    Test.joins('JOIN categories ON categories.id = category_id').where(tests: { level: level })
  end
end
