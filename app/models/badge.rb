class Badge < ApplicationRecord
  has_many :test_passages
  has_and_belongs_to_many :users

  validates :rule_name, presence: true
  validates :rule_name, uniqueness: { scope: :rule_value }

  def set_body
    self.body = rule_name + '_' + rule_value + '.png'
  end

  def self.rule_names
    ['by_score', 'from_first_attempt', 'by_complexity']
  end

  def self.rule_values(rule_name)
    case rule_name
    when 'by_score'
      [80, 100]
    when 'from_first_attempt'
      [nil]
    when 'by_complexity'
      ['elementary', 'intermediate', 'advanced']
    end
  end
end
