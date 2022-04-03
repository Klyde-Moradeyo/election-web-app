json.extract! ballot, :id, :user_id, :title, :description, :URL, :ballot_type, :record_updated_at, :created_at, :updated_at
json.url ballot_url(ballot, format: :json)
