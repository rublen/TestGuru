class Test < ApplicationRecord
  def self.by_category(name)
    self.joins('JOIN categories ON category_id = categories.id')
      .where(categories: { title: name })
      .order(title: :desc).pluck(:title)
  end
end
