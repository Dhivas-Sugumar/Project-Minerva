class Section < ApplicationRecord
  has_rich_text :body
  has_many :lessons, dependent: :destroy
  belongs_to :course

  accepts_nested_attributes_for :lessons

  validates_with RichTextValidator
  validates :title, length: {minimum: 1}


end
