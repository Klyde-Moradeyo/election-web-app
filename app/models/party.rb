class Party < ApplicationRecord
  validates_presence_of :ballot_id, :title

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
  has_many :options
end
