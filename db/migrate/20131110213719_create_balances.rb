class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.belongs_to :goal
      t.belongs_to :user
      t.integer :current_savings
    end
  end
end
