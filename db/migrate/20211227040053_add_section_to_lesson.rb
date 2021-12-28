class AddSectionToLesson < ActiveRecord::Migration[7.0]
  def change
    add_reference :lessons, :section, null: false, foreign_key: true
  end
end
