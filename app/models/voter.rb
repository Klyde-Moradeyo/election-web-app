class Voter < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
end
