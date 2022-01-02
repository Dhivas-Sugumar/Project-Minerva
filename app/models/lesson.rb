class Lesson < ApplicationRecord
  has_rich_text :body
  belongs_to :section
  has_many :videos
end
