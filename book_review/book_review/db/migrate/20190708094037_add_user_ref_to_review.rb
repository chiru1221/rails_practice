class AddUserRefToReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :user
  end
end
