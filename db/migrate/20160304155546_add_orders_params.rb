class AddOrdersParams < ActiveRecord::Migration
  def change
  	add_column :orders, :price, :float
  	add_column :orders, :status, :integer
  end
end
