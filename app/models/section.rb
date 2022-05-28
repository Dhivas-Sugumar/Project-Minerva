class Section < ApplicationRecord
  has_rich_text :body
  has_many :lessons, dependent: :destroy
  belongs_to :course

  accepts_nested_attributes_for :lessons

  validates_with RichTextValidator, unless: :course_draft?
  validates :title, length: {minimum: 1}

  def course_draft?
    course.draft
  end


end
