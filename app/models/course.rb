class Course < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :lessons, :through => :sections
  has_many :enrolls
  has_many :reviews
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :sections


  has_rich_text :description
end
