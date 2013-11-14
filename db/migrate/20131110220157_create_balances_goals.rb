class CreateBalancesGoals < ActiveRecord::Migration
  def change
    create_table :balances_goals do |t|
      t.belongs_to :goal
      t.belongs_to :balance
    end
  end
end
