class Permission < ApplicationRecord
  validates_presence_of :user_id
  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :user
end
