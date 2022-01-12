class RemoveEnrollToCourse < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses,:enrolled
  end
end
