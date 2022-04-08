class Voter < ApplicationRecord
  validates_presence_of :user_id, :username, :password, :vote_weight, :store_voter

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
end
