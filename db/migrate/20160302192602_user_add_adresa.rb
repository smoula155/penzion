class UserAddAdresa < ActiveRecord::Migration
  def change
  	add_column :users, :address, :string
  	add_column :users, :tel, :string
  end
end
