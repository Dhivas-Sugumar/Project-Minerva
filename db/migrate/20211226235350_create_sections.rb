class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.text :body
      t.string :int
      t.string :section_id

      t.timestamps
    end
  end
end
