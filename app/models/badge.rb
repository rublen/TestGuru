class Badge < ApplicationRecord
  has_many :test_passages
  has_and_belongs_to_many :users

  validates :criterion, presence: true, uniqueness: true

  # criterion is one of: %w[well_done hundred first_attempt elementary intermediate advanced]
  # every criterion related to appropriate png-file in /assets/images: well_done.png, hundred.png etc

  def self.criteria
    criteria = %w[well_done hundred first_attempt elementary intermediate advanced]
    criteria.join(', ')
  end

  def self.test_result_badge(score)
    if score == 100
      find_by_criterion('hundred')
    elsif score >= 80
      find_by_criterion('well_done')
    end
  end

  def self.first_attempt_badge(test)
    find_by_criterion('first_attempt') if test.test_passages.count == 1
  end

  def self.level_badge(test, user)
    if test.in? Test.elementary
      give_badge('elementary', user) if user.scope_completed?(:elementary)
    elsif test.in? Test.intermediate
      give_badge('intermediate', user) if user.scope_completed?(:intermediate)
    elsif test.in? Test.advanced
      give_badge('advanced', user) if user.scope_completed?(:advanced)
    end
  end

  private
  def self.give_badge(scope, user)
      badge = find_by_criterion(scope)
      badge unless user.badges.include? badge
  end
end
