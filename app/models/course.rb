class Course < ApplicationRecord
  has_many :sections
  has_many :enrolls
  has_many :reviews
  has_and_belongs_to_many :categories

  has_rich_text :description
end
