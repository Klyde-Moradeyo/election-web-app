class Ballot < ApplicationRecord
  validates :title, :start_date, presence: true
  validates :end_date, date: { after_or_equal_to: :start_date }, presence: true
  before_create :generate_token
  resourcify

  VOTING_TYPE = ["Normal", "Modified Borda count", "D'Hondt"].freeze

  # ==========================
  # RELATIONSHIPS
  # ==========================
  # Users
  belongs_to :user, class_name: "User"
  has_many :admin, -> { where(roles: { name: :admin }) }, dependent: :destroy, through: :roles, class_name: "User", source: :users
  has_many :host, -> { where(roles: { name: :host }) }, dependent: :destroy, through: :roles, class_name: "User", source: :users

  has_many :voters, dependent: :destroy

  # Ballot
  has_many :questions, dependent: :destroy
  has_many :options, through: :questions, dependent: :destroy
  accepts_nested_attributes_for :questions

  # Results
  has_many :ballot_results, dependent: :destroy
  has_many :question_results, dependent: :destroy

  protected

  def generate_token
    loop do
      time = Time.zone.now
      token = "#{time.month}#{rand(111)}#{time.hour}"
      if token.length > 6
        token = token[0...6]
      elsif token.length != 6
        i = (6 - token.length)
        i.times { token = "#{token}#{rand(11)}" }
      end
      self.access_token = token
      break token unless Ballot.exists?(access_token: token)
    end
  end
end
