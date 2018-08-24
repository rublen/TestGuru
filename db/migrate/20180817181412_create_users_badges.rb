class CreateUsersBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :users_badges, id: false do |t|
      t.references :user, foreign_key: true
      t.references :badge, foreign_key: true
    end
  end
end
