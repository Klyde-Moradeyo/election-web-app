class BallotResult < ApplicationRecord
  validates :content, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
  belongs_to :question_result
end
