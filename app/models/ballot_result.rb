class BallotResult < ApplicationRecord
  validates_presence_of :question_result_id, :content

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
  belongs_to :question_result
end
