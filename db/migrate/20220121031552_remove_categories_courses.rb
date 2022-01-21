class RemoveCategoriesCourses < ActiveRecord::Migration[7.0]
  def change
    drop_table :categories_courses
  end
end
