class CreateTransactionsTwo < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :user
      t.belongs_to :goal
      t.string :description, null: false
      t.integer :amount, null: false
    
      t.timestamps
    end
  end
end
