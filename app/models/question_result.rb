class QuestionResult < ApplicationRecord
  validates :question, uniqueness: { scope: [:ballot, :voter] }
  serialize :voter_id
  encrypts :voter_id, deterministic: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  belongs_to :ballot
  belongs_to :voter
  belongs_to :option
end
