class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :reviews
  has_many :enrolls
  has_many :courses, as: :courseable
  validates :username, presence: true, length: { minimum: 1, maximum: 50 }
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
