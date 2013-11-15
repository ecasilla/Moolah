class RemoveTableBalancesGoals < ActiveRecord::Migration
  def change
    drop_table :balances_goals
  end
end
