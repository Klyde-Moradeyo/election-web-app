class User < ApplicationRecord
  rolify before_add: :before_add_method
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :email, presence: true

  # ==========================
  # RELATIONSHIPS
  # ==========================
  has_many :stored_voters, dependent: :destroy
  has_many :ballots, dependent: :destroy, through: :roles, source: :resource, source_type: :Ballot
  has_many :hosted_ballots, -> { where(roles: { name: :host }) }, dependent: :destroy, through: :roles, source: :resource, source_type: :Ballot
  has_many :voter_ballots, -> { where(roles: { name: :voter }) }, dependent: :destroy, through: :roles, source: :resource, source_type: :Ballot

  after_create :assign_default_role
  validate :must_have_a_role, on: :update

  private

  def before_add_method(role)
    # do something before it gets added
  end

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "must have at least 1 role")
    end
  end

  def assign_default_role
    add_role(:newuser) if roles.blank?
  end
end
