class Lesson < ApplicationRecord
  has_rich_text :body
  belongs_to :section
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :videos

  validates_with RichTextValidator , allow_blank: true
  validates :title, length: {minimum: 1}



end
