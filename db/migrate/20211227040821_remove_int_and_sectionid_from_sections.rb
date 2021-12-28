class RemoveIntAndSectionidFromSections < ActiveRecord::Migration[7.0]
  def change
    remove_column :sections, :int
    remove_column :sections, :section_id
  end
end
