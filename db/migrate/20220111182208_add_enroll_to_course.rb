class AddEnrollToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses , :enrolled, :boolean
  end
end
