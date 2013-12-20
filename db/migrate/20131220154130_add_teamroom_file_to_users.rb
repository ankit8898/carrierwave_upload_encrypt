class AddTeamroomFileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teamroom_file, :string
  end
end
