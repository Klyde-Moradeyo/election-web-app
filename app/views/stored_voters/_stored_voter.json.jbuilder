json.extract! stored_voter, :id, :user_id, :username, :password, :email, :vote_weight, :created_at, :updated_at
json.url stored_voter_url(stored_voter, format: :json)
