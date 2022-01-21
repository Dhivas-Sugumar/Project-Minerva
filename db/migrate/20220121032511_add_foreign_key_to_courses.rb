class AddForeignKeyToCourses < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :courses, :categories
  end
end
