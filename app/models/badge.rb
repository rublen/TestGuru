class Badge < ApplicationRecord
  RULES = {
    'by_score' => [80, 100],
    'from_first_attempt' => [nil],
    'by_complexity' => ['elementary', 'intermediate', 'advanced']
  }

  has_many :test_passages
  has_and_belongs_to_many :users

  validates :rule_name, presence: true
  validates :rule_name, uniqueness: { scope: :rule_value }

  def set_body
    self.body = rule_name + '_' + rule_value + '.png'
  end

  def self.rule_names
    RULES.keys
  end

  def self.rule_values(rule_name)
    RULES[rule_name]
  end
end
