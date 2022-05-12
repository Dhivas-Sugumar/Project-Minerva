class Course < ApplicationRecord

  belongs_to :user
  belongs_to :category

  has_many :sections, dependent: :destroy
  has_many :lessons, :through => :sections
  has_many :enrolls
  has_many :reviews

  accepts_nested_attributes_for :sections, allow_destroy: true

  mount_uploader :banner, BannerUploader


  has_rich_text :description

  paginates_per 40
  # Returns a boolean value representing if a course has enrolls.
  def has_enroll?
    enrolls.any?
  end

  # Returns a boolean value representing if a given user is enrolled in the course.
  def enrolled?(user)
    return self.enrolls.find{|enroll| enroll.user_id == user.id}
  end
end
