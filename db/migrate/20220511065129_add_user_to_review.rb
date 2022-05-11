class AddUserToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews ,:user_id ,:bigint
  end
end
