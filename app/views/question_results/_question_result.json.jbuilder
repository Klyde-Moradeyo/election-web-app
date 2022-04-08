json.extract! question_result, :id, :question_id, :ballot_id, :voter_id, :option_id, :content, :created_at, :updated_at
json.url question_result_url(question_result, format: :json)
