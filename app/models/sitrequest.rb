class Sitrequest < ActiveRecord::Base
  include AASM

  enum invite_kind: {
    for_sitter: 1,
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

    event :accept, after: :add_sitter_to_sit do
      transitions from: :pending, to: :accepted
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end

    event :cancel do
      transitions from: :pending, to: :canceled
    end
  end

  belongs_to :sit

  validates :email, :invite_kind, presence: true 

  before_create { self.code = SecureRandom.hex(32) }
  after_create { SitRequestMailer.send_sitrequest(self).deliver_later }

  private

  def add_sitter_to_sit
    user = User.find_by_email email
    
      if sit.sitter_id.present?
      	raise ArgumentError, 'Sit Already Booked'
      else
      	 sit.sitter_id = user
      end
      
  end

end
