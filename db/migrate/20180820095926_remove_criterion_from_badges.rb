class RemoveCriterionFromBadges < ActiveRecord::Migration[5.1]
  def change
    remove_column :badges, :criterion
  end
end
