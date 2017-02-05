class AddReviewViewcountToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :review_viewcount, :integer, :default => 0
  end
end
