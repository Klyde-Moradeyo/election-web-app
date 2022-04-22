json.extract! voter, :id, :user_id, :username, :password, :email, :vote_weight, :store_voter, :created_at, :updated_at
json.url voter_url(voter, format: :json)
