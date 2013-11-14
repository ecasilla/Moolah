class CreateConnectionsUsers < ActiveRecord::Migration
  def change
    create_table :connections_users do |t|
      t.belongs_to :user
      t.belongs_to :connection
    end
  end
end
