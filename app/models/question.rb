class Question < ApplicationRecord
  validates :question_type, :title, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: proc { |attributes| attributes["title"].blank? }
end
