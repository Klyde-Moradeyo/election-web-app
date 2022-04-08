class QuestionResult < ApplicationRecord
  validates_presence_of :question_id, :ballot_id, :voter_id, :option_id

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  belongs_to :ballot
  belongs_to :voter
  belongs_to :option
end
