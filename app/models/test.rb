class Test < ApplicationRecord
  def self.by_category(name)
    self.where("category_id = ?", Category.find_by(title: name).id).order(title: :desc).pluck(:title)
  end
end

