class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.timestamps null: false
      t.date :from_date, null: false
      t.date :to_date, null: false
      t.integer :room_id, null: false
      t.integer :user_id, null: false
      t.boolean :authorized, default: false
    end
  end
end
