class AddIdDatastampsToBadgesUsersAndBadges < ActiveRecord::Migration[5.1]
  def change
    add_column :badges_users, :id, :primary_key
    add_column :badges_users, :created_at, :datetime, null: false
    add_column :badges_users, :updated_at, :datetime, null: false
    add_column :badges, :created_at, :datetime, null: false
    add_column :badges, :updated_at, :datetime, null: false
  end
end
