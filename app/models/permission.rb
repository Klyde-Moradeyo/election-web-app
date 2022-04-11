class Permission < ApplicationRecord
  validates_presence_of :user_id, :isAdmin
  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :users
end
