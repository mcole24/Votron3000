class AddVoteCountToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :vote_number, :integer
  end
end
