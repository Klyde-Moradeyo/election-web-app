json.extract! guest_voter, :id, :user_id, :username, :password, :vote_weight, :record_updated_at, :created_at, :updated_at
json.url guest_voter_url(guest_voter, format: :json)
