class Section < ApplicationRecord
  has_rich_text :body
  has_many :lessons, dependent: :destroy
  belongs_to :course

  accepts_nested_attributes_for :lessons

  validates :body, length: {minimum: 25, maximum: 400 }, allow_blank: false
  validates :title, length: {minimum: 1}


end
