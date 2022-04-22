class Ballot < ApplicationRecord
  validates :title, :URL, :ballot_type, :start_date, :end_date, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
  has_many :voters
  has_many :questions, dependent: :destroy
  has_many :partys, dependent: :destroy
  has_many :ballot_results, dependent: :destroy
  has_many :stored_voters, through: :user
  has_many :options, through: :questions
  has_many :question_results, through: :questions

  accepts_nested_attributes_for :questions
end
