json.extract! vote, :id, :vote_value, :user_id, :project_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)
