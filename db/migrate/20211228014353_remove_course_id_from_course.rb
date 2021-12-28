class RemoveCourseIdFromCourse < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses , :course_id
  end
end
