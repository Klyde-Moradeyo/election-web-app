class Ballot < ApplicationRecord
  validates_presence_of :user, :title, :URL, :ballot_type, :start_date, :end_date

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
  has_many :questions
  has_many :partys
  has_many :options, through: :questions
  has_many :ballot_results
  has_many :question_results, through: :questions
end
