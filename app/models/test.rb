class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :level, numericality: {
    only_integer: true,
    greater_than: 0,
    message: 'should be a nutural number'
  }
  validates :title, presence: true, uniqueness: {
    scope: :level,
    message: ->(test, data) {"'#{data[:value]}' with level '#{test.level}' is taken already"}
  }

  scope :elementary, -> { where level: 0..1 }
  scope :intermediate, -> { where level: 2..4 }
  scope :advanced, -> { where level: 5..Float::INFINITY }

  def self.select_by_category(name)
    joins(:category).where(categories: { title: name })
    .order(title: :desc).pluck(:title)
  end
end
