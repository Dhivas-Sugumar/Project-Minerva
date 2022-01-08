class AddBannerToCOurse < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses , :header
    add_column :courses, :banner,:string
  end
end
