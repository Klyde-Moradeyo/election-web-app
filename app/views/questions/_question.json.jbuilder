json.extract! question, :id, :ballot_id, :question_type, :title, :description, :randomize_selection, :voter_abstain, :record_updated_at, :created_at, :updated_at
json.url question_url(question, format: :json)
