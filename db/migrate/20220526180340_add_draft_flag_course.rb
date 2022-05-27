class AddDraftFlagCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :draft , :boolean
  end
end
