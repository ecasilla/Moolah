class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.text :photo_url
      t.integer :total_savings

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
