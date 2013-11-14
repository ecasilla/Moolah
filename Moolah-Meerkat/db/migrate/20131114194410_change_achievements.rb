class ChangeAchievements < ActiveRecord::Migration
  def change
  	remove_column :achievements, :goal_name
  	add_column :achievements, :goal_id, :integer, null: false
  end
end
