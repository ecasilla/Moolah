class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :balance
      t.string :name, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end