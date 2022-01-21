class Category < ApplicationRecord
  has_many :courses, as: :courseable
end
