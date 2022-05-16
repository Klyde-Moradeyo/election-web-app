class Question < ApplicationRecord
  validates :question_type, :title, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
  has_many :options, dependent: :destroy
  has_many :question_results, dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: proc { |attributes| attributes["title"].blank? }
end
