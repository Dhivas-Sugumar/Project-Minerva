class AddForeignKeyToEnrolls < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :enrolls, :users
    add_foreign_key :enrolls, :courses

  end
end
