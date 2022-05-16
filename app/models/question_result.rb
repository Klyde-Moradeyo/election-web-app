class QuestionResult < ApplicationRecord
  validates :question, uniqueness: { scope: [:ballot, :voter] }
  
  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  belongs_to :ballot
  belongs_to :voter
  belongs_to :option
end
