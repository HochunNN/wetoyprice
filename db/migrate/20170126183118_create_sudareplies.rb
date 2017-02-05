class CreateSudareplies < ActiveRecord::Migration
  def change
    create_table :sudareplies do |t|
      t.string :sudareplyname
      t.string :sudareplycontent
      t.integer :suda_id

      t.timestamps null: false
    end
  end
end
