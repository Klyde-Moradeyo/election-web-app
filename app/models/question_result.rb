class QuestionResult < ApplicationRecord
  belongs_to :question
  belongs_to :ballot
end
