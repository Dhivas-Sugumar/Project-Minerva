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
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  # gets users avatar
  def get_avatar
    avatar.url
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

  #checks if a user should be assigned admin privilages
  def assign_admin

  end

end
