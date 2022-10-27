class RemoveReviewUserIdError < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :courses, :reviews
  end
end
