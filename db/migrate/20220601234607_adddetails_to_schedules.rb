class AdddetailsToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :user_id, :integer
    add_column :schedules, :group_id, :integer
  end
end
