class CreateGoalsUsers < ActiveRecord::Migration
  def change
    create_table :goals_users do |t|
      t.belongs_to :goal
      t.belongs_to :user
    end
  end
end
