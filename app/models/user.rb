class User < ActiveRecord::Base
  belongs_to :role
  has_many :posts

  # Include default devise modules.
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  after_initialize :set_role, :if => :new_record?
  before_save -> do
    self.uid = SecureRandom.uuid
  end

  def admin?
    self.role.name == Role::NAMES[:admin]
  end

  def set_role(name=Role::NAMES[:registered])
    self.role ||= Role.find_by_name(name)
  end

  def as_json(options = {})
    options = { :only => [:email, :id], include: {role: { only: [:name] }}  }.merge(options)
    super(options)
  end
end
