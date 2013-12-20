class AddIvAndSaltToUsers < ActiveRecord::Migration
  def change
    add_column :users, :iv, :binary
    add_column :users, :salt, :binary
  end
end
