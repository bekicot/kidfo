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
    # Person with Kids, Family, But Does not Sit for Others
    parentuser: 1,
    # Person who watches for families, but doesn't have family.
    sitteruser: 2,
    # Person with Kids, Family, also been invited to view/sit for other families.
    parentsitteruser: 3
  }

  validates :role, presence: true
end
