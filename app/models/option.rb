class Option < ApplicationRecord
  belongs_to :question
  belongs_to :ballot
  belongs_to :party
end
