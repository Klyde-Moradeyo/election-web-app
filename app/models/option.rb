class Option < ApplicationRecord
  validates :title, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  has_one :ballot, through: :question
  has_one :party
end
