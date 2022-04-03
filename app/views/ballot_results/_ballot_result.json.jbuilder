json.extract! ballot_result, :id, :ballot_id, :question_result_id, :content, :created_at, :updated_at
json.url ballot_result_url(ballot_result, format: :json)
