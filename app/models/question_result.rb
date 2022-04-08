class QuestionResult < ApplicationRecord
  belongs_to :question
  belongs_to :ballot
  belongs_to :voter
  belongs_to :option
end
