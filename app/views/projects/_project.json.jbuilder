json.extract! project, :id, :title, :video_url, :description, :created_at, :updated_at
json.url project_url(project, format: :json)
