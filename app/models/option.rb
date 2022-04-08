class Option < ApplicationRecord
  validates_presence_of :ballot_id, :title

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  belongs_to :ballot
end
