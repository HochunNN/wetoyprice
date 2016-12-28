class CreateSudas < ActiveRecord::Migration
  def change
    create_table :sudas do |t|

      t.string  :suda_title
      t.string  :suda_writer
      t.string  :suda_content


      t.timestamps null: false
    end
  end
end
