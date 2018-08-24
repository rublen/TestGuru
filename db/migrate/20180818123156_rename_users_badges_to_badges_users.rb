class RenameUsersBadgesToBadgesUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :users_badges, :badges_users
  end
end
