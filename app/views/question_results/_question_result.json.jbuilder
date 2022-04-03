json.extract! question_result, :id, :question_id, :ballot_id, :content, :record_updated_at, :created_at, :updated_at
json.url question_result_url(question_result, format: :json)
