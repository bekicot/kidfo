class Kid < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  include AvatarUrlable

  belongs_to :family
  has_many :favorites

  GENDER = {

    'Male' => 'M',
    'Female' => 'F'

  }.freeze

  validates :name, presence: true

  def as_json(options={})
    super(options.merge(methods: [:avatar_url], except: :avatar))
  end

end
