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

  # Returns a boolean value representing if a course has enrolls.
  def has_enroll?
    return enrolls.any?
  end

  def enrolled?(user)
    !! self.enrolls.find{|enroll| enroll.user == user.id}
  end
end
