class Section < ApplicationRecord
  has_rich_text :body
  has_many :lessons
  belongs_to :course
end
