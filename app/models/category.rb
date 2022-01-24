class Category < ApplicationRecord
  has_many :courses
  mount_uploader :banner, BannerUploader
end
