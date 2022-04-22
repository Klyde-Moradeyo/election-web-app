class Voter < ApplicationRecord
  validates :username, :password, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
end
