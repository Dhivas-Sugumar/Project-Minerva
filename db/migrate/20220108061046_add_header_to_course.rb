class AddHeaderToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses , :banner, :string
  end
end
