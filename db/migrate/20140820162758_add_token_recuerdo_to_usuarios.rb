class AddTokenRecuerdoToUsuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :token_recuerdo, :string
  	add_index :usuarios, :token_recuerdo
  end
end
