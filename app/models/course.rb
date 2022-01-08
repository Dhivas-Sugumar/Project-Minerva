class Course < ApplicationRecord

  belongs_to :user

  has_many :sections, dependent: :destroy
  has_many :lessons, :through => :sections
  has_many :enrolls
  has_many :reviews
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :sections

  mount_uploader :header, HeaderUploader


  has_rich_text :description
end
