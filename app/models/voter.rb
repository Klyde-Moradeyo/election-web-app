class Voter < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, :password, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot

  has_many :question_results, dependent: :destroy
end
