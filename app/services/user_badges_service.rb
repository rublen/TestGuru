class UserBadgesService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    @earned_badges = []
    Badge.find_each do |badge|
      @earned_badges << badge if send("passed_#{badge.rule_name}?", badge.rule_value)
    end
    @earned_badges
  end

  private

  def passed_by_score?(value)
    if @test_passage.score >= value.to_i
    # проверяем, нет ли заработанных за текущий тест бейджей с меньшим rule_value,
    # если есть - удаляем из @earned_badges и возвращаем true
      badge = @earned_badges.find { |b| b.rule_name == 'by_score' }
      return true unless badge
      if badge.rule_value.to_i < value.to_i
        @earned_badges.delete(badge)
        return true
      end
    end
    false
  end

  def passed_from_first_attempt?(_value)
    @test_passage.score >= 80 && @test_passage.test.test_passages.count == 1
  end

  def passed_by_complexity?(value)
    user = @test_passage.user
    badge = Badge.find_by(rule_name: 'by_complexity', rule_value: value)
    !user.badges.include?(badge) && user.complexity_tests_completed?(value)
  end
end
