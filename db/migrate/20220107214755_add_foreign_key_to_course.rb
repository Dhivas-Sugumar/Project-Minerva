class AddForeignKeyToCourse < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key  :courses, :users
  end
end
