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

  #Gets the username of the user
  def get_username
    User.find(user_id).username
  end

end
