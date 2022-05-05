json.extract! question_result, :id, :voter_id, :question_id, :content, :created_at, :updated_at
json.url question_result_url(question_result, format: :json)
