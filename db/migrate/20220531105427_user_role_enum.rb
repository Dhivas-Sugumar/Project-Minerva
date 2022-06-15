class UserRoleEnum < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin
    add_column :users, :role, :integer
  end
end
