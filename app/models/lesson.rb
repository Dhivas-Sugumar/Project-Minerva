class Lesson < ApplicationRecord
  has_rich_text :body
  belongs_to :section
  has_many :videos, dependent: :destroy
  accepts_nested_attributes_for :videos

  validates :title, length: {minimum: 1}, unless: :course_draft?
  validates_with RichTextValidator, unless: :course_draft?


  def course_draft?
    section.course_draft?
  end



end
