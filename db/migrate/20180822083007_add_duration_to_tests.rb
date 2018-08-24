class AddDurationToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :duration, :integer, default: 0
  end
end
