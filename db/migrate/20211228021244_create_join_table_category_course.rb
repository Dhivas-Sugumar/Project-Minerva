class CreateJoinTableCategoryCourse < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :courses do |t|
      t.index [:category_id, :course_id]
      # t.index [:course_id, :category_id]
    end
  end
end
