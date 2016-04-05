class AddOrderVarsymbol < ActiveRecord::Migration
  def change
    	add_column :orders, :var_symbol, :string
  end
end
