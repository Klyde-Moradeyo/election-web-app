class StoredVoter < ApplicationRecord
  validates_presence_of :user_id, :username, :password, :vote_weight

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
end
