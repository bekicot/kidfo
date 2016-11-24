class Kid < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  belongs_to :family
  has_many :favorites

  GENDER = {

    'Male' => 'M',
    'Female' => 'F'

  }.freeze

  validates :name, presence: true
end
