class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  extend FriendlyId
  friendly_id :username, use: :slugged


  has_many :reviews, dependent: :destroy
  has_many :enrolls, dependent: :destroy
  has_many :courses ,dependent: :destroy
  validates :username, presence: true, length: { minimum: 1, maximum: 50 }
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # sets the role for a user.
  # Is either admin or user
  def set_default_role
    if assign_admin?
      self.role = :admin
    else
      self.role = :user
    end

  end

  # checks if a given user's email is a minervaeducation domain.To assign admin privileges.
  def assign_admin?
    email =~ /\b[A-Z0-9._%a-z\-]+@minervaeducation\.us\z/

  end

  # gets users avatar
  def get_avatar
    return avatar? ? avatar.url : "user.png"
  end

  # gets users courses
  def get_courses
    courses.filter_by_draft(false)
  end

  # gets users enrolls
  def get_enrolls
    enrolls
  end

  # Gets users drafts
  def get_drafts
    courses.filter_by_draft(true)
  end

end
