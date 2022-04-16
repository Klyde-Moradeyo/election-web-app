class Option < ApplicationRecord
  validates_presence_of :title

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  has_one :ballot, through: :question
end
