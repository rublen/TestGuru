class AddColumnCriterionToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :criterion, :string, null: false, unique: true
  end
end
