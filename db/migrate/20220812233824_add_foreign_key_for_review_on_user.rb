class AddForeignKeyForReviewOnUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :user_id, index:true
  end
end
