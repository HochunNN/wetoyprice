class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string    :product_picture_url
      t.string    :product_website
      t.string    :product_website_detail_address
      t.string    :product_title
      t.integer   :product_price
      t.string    :product_number
      t.string    :product_category
      
      
      
      t.timestamps null: false
    end
  end
end
