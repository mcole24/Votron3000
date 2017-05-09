class ChangeColumnNullForProjects < ActiveRecord::Migration[5.0]
  def change
  	change_column_null :projects, :description, true
  	change_column_null :projects, :images, true
  	change_column_null :projects, :video_url, true
  end
end
