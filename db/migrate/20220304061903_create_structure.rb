class CreateStructure < ActiveRecord::Migration[7.0]
  def change
    create_table :structures do |t|
      t.timestamps
    end
  end
end
