class Family < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  has_many :parenthoods
  has_many :users, through: :parenthoods
  has_many :kids
  has_many :familysitters
  has_many :sitters, through: :familysitters
  has_many :invites
  has_many :sits

  validates :name, presence: true

  accepts_nested_attributes_for :kids, reject_if: :all_blank, allow_destroy: true
  # for ActiveAdmin
  accepts_nested_attributes_for :users, :sitters

  alias parents users

  def may_invite_spouse?
    parents.count < 2
  end
end
