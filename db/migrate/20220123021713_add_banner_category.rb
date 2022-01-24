class AddBannerCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories , :banner, :string
  end
end
