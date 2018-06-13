class Test < ApplicationRecord
  def self.by_category(name)
    self.joins('JOIN categories ON category_id = categories.id')
      .where(categories: { title: name })
      .pluck(:title).sort.reverse
  end
end

