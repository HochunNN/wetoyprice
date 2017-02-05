class AddSudaViewcountToSudas < ActiveRecord::Migration
  def change
    add_column :sudas, :suda_viewcount, :integer, :default => 0
  end
end
