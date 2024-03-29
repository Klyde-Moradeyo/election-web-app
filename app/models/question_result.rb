class QuestionResult < ApplicationRecord
  validates :question, uniqueness: { scope: [:ballot, :voter] }
  scope :voter_result, ->(voter_id) { where(voter_id: voter_id) }

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  belongs_to :ballot
  belongs_to :voter
  belongs_to :option

  has_many :question_result_ranks, dependent: :destroy
  accepts_nested_attributes_for :question_result_ranks, allow_destroy: true
end
