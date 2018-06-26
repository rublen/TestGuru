class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author

  def self.by_category(name)
    self.joins('JOIN categories ON category_id = categories.id')
      .where(categories: { title: name })
      .order(title: :desc).pluck(:title)
  end
end
