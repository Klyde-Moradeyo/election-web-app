class Ballot < ApplicationRecord
  validates_presence_of :user, :title, :url

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
end
