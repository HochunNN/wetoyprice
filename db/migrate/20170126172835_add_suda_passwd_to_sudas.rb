class AddSudaPasswdToSudas < ActiveRecord::Migration
  def change
    add_column :sudas, :suda_passwd, :string
  end
end
