class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.text :title
      t.text :description
      t.integer :members
      t.integer :average
      t.integer :rating
      t.integer :course_id

      t.timestamps
    end
  end
end
