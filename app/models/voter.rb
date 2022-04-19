class Voter < ApplicationRecord
  validates_presence_of  :username, :password, :vote_weight, :store_voter

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
end
