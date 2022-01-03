class Lesson < ApplicationRecord
  has_rich_text :body
  belongs_to :section
  has_many :videos

  accepts_nested_attributes_for :videos


end
