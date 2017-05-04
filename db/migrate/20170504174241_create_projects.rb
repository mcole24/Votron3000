class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :video_url
      t.string :description

      t.timestamps
    end
  end
end
