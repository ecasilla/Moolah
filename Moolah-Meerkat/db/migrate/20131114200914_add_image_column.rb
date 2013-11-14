class AddImageColumn < ActiveRecord::Migration
  def change
    add_column :goals, :photo_url, :string
  end
end
