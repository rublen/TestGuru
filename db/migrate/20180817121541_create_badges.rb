class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :body, null: false
    end
  end
end
