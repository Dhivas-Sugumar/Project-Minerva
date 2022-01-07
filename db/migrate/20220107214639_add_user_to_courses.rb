class AddUserToCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :user
  end
end
