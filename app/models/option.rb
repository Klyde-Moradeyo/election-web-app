class Option < ApplicationRecord
  validates :title, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  has_one :ballot, through: :question
  has_many :question_results
end
