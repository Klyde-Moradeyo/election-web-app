class Voter < ApplicationRecord
  validates :username, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
end
