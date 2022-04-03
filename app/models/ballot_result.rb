class BallotResult < ApplicationRecord
  belongs_to :ballot
  belongs_to :question_result
end
