class Test < ApplicationRecord
  def self.by_category(name)
    c_id = Category.find_by(title: name).id
    self.where("category_id = ?", c_id).order(title: :desc).pluck(:title)
  end
end
