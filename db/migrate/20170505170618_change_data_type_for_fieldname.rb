class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.0]
  def change
    change_table :projects do |t|
      t.change :vote_count, :integer, default: 0
    end
  end
end
