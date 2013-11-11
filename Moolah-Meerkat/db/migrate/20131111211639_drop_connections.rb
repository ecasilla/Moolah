class DropConnections < ActiveRecord::Migration
  def change
    drop_table :connections
    drop_table :connections_users
  end
end
