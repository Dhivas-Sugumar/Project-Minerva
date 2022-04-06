class Category < ApplicationRecord
  has_many :courses
  mount_uploader :banner, BannerUploader


  def course_count
    courses.size
  end
end
