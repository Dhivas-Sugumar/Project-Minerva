class Course < ApplicationRecord

  scope :filter_by_draft, -> (draft) { where draft: draft }



  belongs_to :user, validate: true
  belongs_to :category, validate: true

  has_many :sections, dependent: :destroy
  has_many :lessons, :through => :sections
  has_many :enrolls
  has_many :reviews, dependent: :destroy

  accepts_nested_attributes_for :sections, allow_destroy: true

  mount_uploader :banner, BannerUploader


  has_rich_text :description

  validates_with RichTextValidator, unless: :draft
  validates :title, length: {minimum: 1}, unless: :draft


  paginates_per 40
  # Returns a boolean value representing if a course has enrolls.
  def has_enroll?
    enrolls.any?
  end

  #Returns the number of enrolls for a course.
  def enrolls_count
    enrolls.size
  end

  # Returns a boolean value representing if a given user is enrolled in the course.
  def enrolled?(user)
     self.enrolls.find{|enroll| enroll.user_id == user.id}
  end

  #Gets the course title.
  def get_title
    title
  end

  #Gets the course description
  def get_description
    description
  end

  def instructor?(user)
    user.id == user_id
  end

  def instructor_name
    user.username
  end

  def get_banner
    if banner?
      banner
    else
      category.banner
    end
  end





end
