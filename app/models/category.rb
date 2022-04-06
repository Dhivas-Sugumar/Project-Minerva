class Category < ApplicationRecord
  has_many :courses
  mount_uploader :banner, BannerUploader

  paginates_per 8
end
