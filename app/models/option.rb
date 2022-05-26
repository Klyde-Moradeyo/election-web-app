class Option < ApplicationRecord
  validates :title, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  has_one :ballot, through: :question

  has_many :question_results, dependent: :destroy
  has_many :question_result_ranks, dependent: :destroy
end
