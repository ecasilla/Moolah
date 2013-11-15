class RemoveTableBalances < ActiveRecord::Migration
  def change
    drop_table :balances
  end
end
