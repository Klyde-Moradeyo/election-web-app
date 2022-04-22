json.extract! ballot, :id, :user_id, :title, :description, :URL, :ballot_type, :start_date, :end_date, :weighted_voting, :show_results, :created_at, :updated_at
json.url ballot_url(ballot, format: :json)
