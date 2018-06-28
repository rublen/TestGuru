class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :users, through: :test_passages
  has_many :questions
  has_many :test_passages

  def self.by_category(name)
    joins(:category).where(categories: { title: name })
    .order(title: :desc).pluck(:title)
  end
end
