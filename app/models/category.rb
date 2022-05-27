class Category < ApplicationRecord
  has_many :courses
  mount_uploader :banner, BannerUploader


  def get_courses
    courses.filter_by_draft(false)
  end

  def course_count
    get_courses.size
  end
end
