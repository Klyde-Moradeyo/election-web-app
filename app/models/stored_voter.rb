class StoredVoter < ApplicationRecord
  validates :username, :password, :vote_weight, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
end
