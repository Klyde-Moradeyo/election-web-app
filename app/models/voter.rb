class Voter < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot

  has_many :question_results, dependent: :destroy
end
