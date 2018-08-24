class AddRuleNameAndRuleValueToBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges, :rule_name, :string, null: false
    add_column :badges, :rule_value, :string
    add_index :badges, %i[rule_name rule_value], unique: true
  end
end
