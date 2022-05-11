class Review < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_rich_text :comment

  def get_user
    User.find(user.id)
  end

  def get_course
    Course.find(course.id)
  end
end
