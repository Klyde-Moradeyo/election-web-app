class Option < ApplicationRecord
  validates :title, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :question
  has_many :question_results, dependent: :destroy

end
