class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|

      t.string  :review_title
      t.string  :review_writer
      t.string  :review_content
      t.string  :review_passwd
      t.string  :review_website
      t.string  :review_prod_name
      t.string  :review_image_url
      
      

      t.timestamps null: false
    end
  end
end
