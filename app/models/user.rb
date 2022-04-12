class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates_presence_of :first_name, :last_name, :email, :username, :password

    # ==========================
    # RELATIONSHIPS
    # ==========================
    has_many :voters, dependent: :destroy
    has_many :stored_voters, dependent: :destroy
    has_many :ballots, dependent: :destroy
    has_one :permissions, dependent: :destroy

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # devise :database_authenticatable, :registerable,
    # :recoverable, :rememberable, :trackable, :validatable
end
