class Video < ApplicationRecord
  # belongs_to :lesson
  mount_uploader :videofile, VideoUploader
  mount_uploader :thumbnail, ThumbnailUploader
end
