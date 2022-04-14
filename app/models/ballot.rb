class Ballot < ApplicationRecord
  validates_presence_of :user, :title, :URL, :ballot_type, :start_date, :end_date

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :partys, dependent: :destroy
  has_many :options, through: :questions
  has_many :ballot_results, dependent: :destroy
  has_many :question_results, through: :questions

  accepts_nested_attributes_for :questions
end
