class Invite < ActiveRecord::Base
  include AASM

  enum invite_kind: {
    for_spouse: 0,
    for_sitter: 1
  }

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2,
    canceled: 3
  }

  aasm column: :status, enum: true do
    state :pending, initial: true
    state :accepted
    state :rejected
    state :canceled

    event :accept, after: :create_family_parent_or_sitter do
      transitions from: :pending, to: :accepted
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end

    event :cancel do
      transitions from: :pending, to: :canceled
    end
  end

  belongs_to :family
  belongs_to :user

  validates :email, :invite_kind, presence: true

  before_create { self.code = SecureRandom.hex(32) }
  after_create { InviteMailer.send_invite(self).deliver_later }

  private

  def create_family_parent_or_sitter
    user = User.find_by_email email
    if user.parentuser? && for_spouse?
      user.family = family
    elsif user.sitteruser? && for_sitter?
       
    else
      raise ArgumentError, 'User kind and invite kind do not match'
    end
  end
end
