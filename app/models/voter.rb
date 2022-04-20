class Voter < ApplicationRecord
  validates :username, :password, :vote_weight, :store_voter, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
end
