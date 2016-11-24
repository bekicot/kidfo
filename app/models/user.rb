class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # for parents
  has_one :parenthood
  has_one :family, through: :parenthood

  # invites
  has_many :invites

  # for Sitter only
  has_many :sits, foreign_key: :sitter_id
  has_many :families, through: :sits, source: :family

  enum role: {
    parentuser: 1,
    sitteruser: 2,
    parentsitteruser: 3
  }

  validates :role, presence: true
end
