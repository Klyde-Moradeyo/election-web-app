class Voter < ApplicationRecord
  validates_presence_of  :username, :password

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
end
