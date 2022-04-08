class Question < ApplicationRecord
  validates_presence_of :ballot_id, :question_type, :title

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
end
