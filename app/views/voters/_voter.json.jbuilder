json.extract! voter, :id, :user_id, :username, :password, :vote_weight, :record_updated_at, :store_voter, :created_at, :updated_at
json.url voter_url(voter, format: :json)
