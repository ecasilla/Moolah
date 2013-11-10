class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.text :description
      t.integer :final_amount, null: false
      t.date :deadline

      t.timestamps
     end
  end
end
