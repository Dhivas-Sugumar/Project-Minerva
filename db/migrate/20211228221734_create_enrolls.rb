class CreateEnrolls < ActiveRecord::Migration[7.0]
  def change
    create_table :enrolls do |t|
      t.bigint :user_id
      t.bigint :course_id
      t.boolean :completed

      t.timestamps
    end
  end
end
