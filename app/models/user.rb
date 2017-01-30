class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_reader :token

  # for parents
  has_one :parenthood
  has_one :family, through: :parenthood

  # invites
  has_many :invites

  # for Sitter only
  has_many :familysitters, foreign_key: :sitter_id
  has_many :families, through: :familysitters, source: :family
  has_many :kids, through: :family

  # Access Token
  has_many :access_token, class_name: 'Doorkeeper::AccessToken', foreign_key: :resource_owner_id

  enum role: {
    # Person with Kids, Family, But Does not Sit for Others
    parentuser: 1,
    # Person who watches for families, but doesn't have family.
    sitteruser: 2,
    # Person with Kids, Family, also been invited to view/sit for other families.
    parentsitteruser: 3
  }

  validates :role, presence: true

  def token(application = Doorkeeper::DefaultApplication)
    Doorkeeper::AccessToken.create(application: application, resource_owner_id: id).token
  end

  def as_json(options=nil)
    options = options || {}
    super(options.merge(methods: [:token]))
  end
end
