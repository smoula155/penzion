class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|

      t.timestamps null: false
      t.integer :typ
    end
  end
end
