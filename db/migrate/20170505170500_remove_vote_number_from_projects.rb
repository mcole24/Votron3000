class RemoveVoteNumberFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :vote_number
  end
end
