class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.belongs_to :user
      t.string :name
      t.date :date
      t.string :goal_name

      t.timestamps
    end
  end
end
