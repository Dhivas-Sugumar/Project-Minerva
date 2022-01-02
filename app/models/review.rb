class Review < ApplicationRecord
  belongs_to :course
  has_rich_text :comment
end
