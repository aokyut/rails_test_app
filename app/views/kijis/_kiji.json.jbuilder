json.extract! kiji, :id, :title, :content, :user_id, :created_at, :updated_at
json.url kiji_url(kiji, format: :json)
