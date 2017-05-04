class AddTeamNameToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :team_name, :string
  end
end
