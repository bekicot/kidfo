class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  include AvatarUrlable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true

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

  def access_token(application=nil)
    application = Doorkeeper::Application.where(name: 'default', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob').first_or_create unless application
    Doorkeeper::AccessToken.create(application: application, resource_owner_id: id).token
  end

  def as_json(options=nil)
    options = options || {}
    super(options.merge(methods: [:access_token, :name, :avatar_url], except: :avatar))
  end


  def name
    super || first_name.to_s + ' ' + last_name.to_s
  end
end
