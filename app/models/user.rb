class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :parenthood
  has_one :family, through: :parenthood

  # invites
  has_many :invites

  #for guardian only

  enum role: {
    parentuser: 1,
    sitteruser: 2
  }
  
  validates :role, presence: true
end
