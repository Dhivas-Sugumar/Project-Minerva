class IndexEnroll < ActiveRecord::Migration[7.0]
  def change
    add_index :enrolls, [:user_id, :course_id], unique: true
  end
end
