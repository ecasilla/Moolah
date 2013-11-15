class CreateConnectionsAgain < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.belongs_to :user
      t.belongs_to :friend
    end
  end
end
