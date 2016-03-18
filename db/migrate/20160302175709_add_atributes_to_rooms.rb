class AddAtributesToRooms < ActiveRecord::Migration
  def change
  	 add_column :rooms, :price, :float
  end
end
