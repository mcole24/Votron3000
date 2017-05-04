class AddImagesToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :images, :text
  end
end
