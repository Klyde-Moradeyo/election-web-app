class Voter < ApplicationRecord
  validates :username, presence: true, uniqueness: true, uniqueness: { scope: [:ballot ] }
  validates :email, presence: true, length: { maximum: 100 }
  validate :email_format

  # ==========================
  # RELATIONSHIPS
  # ==========================
  belongs_to :ballot

  has_many :question_results, dependent: :destroy

  private
  def email_format
    validates_format_of :email, :with => Devise::email_regexp if email.present?
  end
end
