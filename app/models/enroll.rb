class Enroll < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :user_id, uniqueness:  {scope: :course_id}

  def get_course
    Course.find(course.id)
  end

  #Gets the course title.
  def get_title
    Course.find(course.id).title
  end

  #Gets the course description
  def get_description
    Course.find(course.id).description
  end
end
