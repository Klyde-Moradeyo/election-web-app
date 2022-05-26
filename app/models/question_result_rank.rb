class QuestionResultRank < ApplicationRecord
  belongs_to :question_result
  belongs_to :option

  validates :question_result, uniqueness: true
end
