json.extract! user, :id, :userid, :name, :role, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
