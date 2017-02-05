class CreateReviewreplies < ActiveRecord::Migration
  def change
    create_table :reviewreplies do |t|
      t.string :reviewreplyname
      t.string :reviewreplycontent
      t.integer :review_id

      t.timestamps null: false
    end
  end
end
