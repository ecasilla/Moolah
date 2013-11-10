class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :balance
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
