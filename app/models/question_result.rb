class QuestionResult < ApplicationRecord
  has_one :voter
  belongs_to :question
end
