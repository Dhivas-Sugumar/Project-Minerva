class AddForeignKeyEnrolls < ActiveRecord::Migration[7.0]
  def change
    add_column :enrolls, "user_id", :bigint
    add_column :enrolls, "course_id", :bigint
  end
end
